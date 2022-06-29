//
//  CardCollectionView.swift
//  Memorize
//
//  Created by Robin Simonneau on 27/06/2022.
//

import SwiftUI

/**
 Vue qui s'occupe d'afficher toute les cartes présente dans une collection
 */
struct CardCollectionView: View {
    
    ///Permet la modification de la mémoire
    @Environment(\.managedObjectContext) var managedObjectContext
    
    ///Bindings de la collection
    @Binding var collectionParent:CollectionEntity
    
    ///permet de récuperer dnas la mémoire par ordre alphabétique toute les collectionEntity
    @FetchRequest(sortDescriptors: [SortDescriptor(\.question)]) var cardE: FetchedResults<CardsEntity>
    
    
    
    ///Variable qui si vrai doit ouvir une page pour ajouter une carte
    @State var addCardOn = false
    ///Variable qui si vrai doit ouvrie une page pour modifier une carte
    @State var editCardOn = false
    
    ///Si est vrai active la possibilité d'éditer
    @State var isEditing = false
    
    ///Désigne la carte selectionné qui doit être modifié
    @State var whichCard:CardsEntity = CardsEntity()
    
    /// Carte a afficher
    @State var cards:Array<CardsEntity> = []
    
    ///si vrai lance une animation
    @State var isErasing = false
    
    func setActualCard(newCard:CardsEntity){
        whichCard = newCard
        editCardOn.toggle()
        isEditing = false
    }
    
    
    /**
     Essaie d'ajouter des cartes
     */
    func testAjoutCard(){
        let newCard = CardsEntity(context: managedObjectContext)
        newCard.id = UUID()
        newCard.question = "Test"
        newCard.response = "Reponse"
        newCard.cardRelation = collectionParent
        collectionParent.addToCollectionRelation(newCard)
        cards.append(newCard)
        collectionParent.nbCards = Int64(collectionParent.collectionRelation!.count)
        if collectionParent.hasChanges{
            PersistenceController.shared.save()
        }
    }
    
    /**
     Supprime de la mémoire une carte
     - Parameter actualCards: La carte a supprimé
     */
    func deleteCard(actualCards:CardsEntity){
        isErasing.toggle()
        DispatchQueue.global(qos: .userInteractive).async {
            
            do{
                sleep(2)
            }
            managedObjectContext.delete(actualCards)
            let id = CardController.getIdFromAList(obj: actualCards, list: cards)
            cards.remove(at: id)
            
            PersistenceController.shared.save()
            
            //On actualise le nombre de carte
            collectionParent.nbCards = Int64(collectionParent.collectionRelation!.count)
            
            PersistenceController.shared.save()
            isErasing.toggle()
        }
    }
    
    /**
     Créer un petit carrée rose qui représente une liste
     - Parameter actualCards : La carte qui va être affiché
     - returns : `some View` Un carré rose qui représente une liste
     */
    fileprivate func categoryCard(_  actualCards:CardsEntity) ->some View {
        return Button(action: {
            if !isEditing{
                setActualCard(newCard: actualCards)
            }
            
        }){
            HStack {
                VStack{
                    
                    Text(actualCards.question ?? "Pas de question")
                        .font(.system(.title2))
                        .padding([.top, .leading])
                        .frame(width: 300, height: 30, alignment: .leading)
                    
                    Text(actualCards.response ?? "Pas de reponse")
                        .font(.system(.caption))
                        .padding([.leading], 20.0)
                        .frame(width: 300, height: 30, alignment: .leading)
                    
                    Spacer()
                    
                }
                if isEditing{
                    Button(action:{
                        
                        deleteCard(actualCards: actualCards)
                        isEditing = false
                    }) {
                        Image(systemName: "multiply")
                    }
                }
                
            }.frame(width: 350, height: 70)
                .background(Color("SecondaryColor"))
                .cornerRadius(6)
                
        }
        .foregroundColor(.white)
        .opacity(!isErasing ? 100: 0.0)
        .animation(.easeInOut(duration: 1.5), value: isErasing )
        .contextMenu{
            VStack {
                Button(action: {
                    /*
                     Lance la page de mofication
                     */
                    setActualCard(newCard: actualCards)
                }) {
                    HStack{
                        Text("Modifier")
                        Image(systemName: "pencil")
                        
                    }
                }
                Button(action: {
                    /*
                     Supprime de la mémoire la collection
                     */
                    
                    deleteCard(actualCards: actualCards)
                    
                    
                }) {
                    HStack{
                        Text("Supprimer")
                            .foregroundColor(Color.red)
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
    
    
    ///Contenue de la vue
    var body: some View {
        
        
        VStack {
            Text(collectionParent.name ?? "No name")
                .font(.system(.largeTitle))
                .padding()
                .foregroundColor(Color("TitleColor"))
            
            
            ScrollView(.vertical){
                LazyVGrid(columns: [GridItem(.flexible(maximum:300))],spacing: 10){
                    
                    ForEach(cards){
                        card in categoryCard(card)
                    }
                    
                }
            }
            .padding(.top,10)
            
            CommonViewElements.actionBarAtBottomPlay(actionPlus: {
                addCardOn = true
                isEditing = false
            },actionPlay: {}, actionEdit: {
                //Si il n'ya pas de carte on a pas besoin de pouvoir les supprimer
                if cards.count != 0{
                    isEditing.toggle()
                }
                
            })
            .padding(.bottom)
            .sheet(isPresented: $addCardOn){
                //Ouvre le formulaire d'ajout
                FormAddCard(shouldQuit: $addCardOn,collectionParent: $collectionParent,cardToShow: $cards)
                    .environment(\.managedObjectContext, managedObjectContext)
            }.sheet(isPresented: $editCardOn){
                //Ouvre le formulaire de modification
                let q = [whichCard.question ?? "",whichCard.questionSup ?? "",whichCard.response ?? "",whichCard.responseSup ?? ""]
                
                
                FormModifyCard(question: q[0], supQuestion: q[1], response: q[2], supResponse:q[3],
                    shouldQuit: $editCardOn, cardEntity:$whichCard, cardToShow: $cards)
                    .environment(\.managedObjectContext, managedObjectContext)
            }
            Spacer()
            
            //Code executé quand la vue apparait
        }.onAppear(perform: {
            //Récupère toute les cartes de la relation entre la collection et les cartes et les ajoute dans les cartes a afficher
            if let relation = collectionParent.collectionRelation{
                for cd in relation.allObjects{
                    cards.append(cd as! CardsEntity)
                }
            }
            
            
            
        })
        .background(Color("BackgroundColor"))
        
    }
}

struct CardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardCollectionView(collectionParent: .constant(CollectionEntity()))
    }
}
