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
    
    

    ///Variable qui si vrai doit ouvir une page
    @State var addCardOn = false
    
    /// Carte a afficher
    @State var cards:Array<CardsEntity> = []
    
    
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
     Créer un petit carrée rose qui représente une liste
     - Parameter actualCards : La carte qui va être affiché
     - returns : `some View` Un carré rose qui représente une liste
     */
    fileprivate func categoryCard(_  actualCards:CardsEntity) ->some View {
        return Button(action: {}){
            VStack{
                
                Text(actualCards.question ?? "Pas de question")
                    .font(.system(.title2))
                    .padding([.top, .leading])
                    .frame(width: 100, height: 30, alignment: .leading)
                
                
                
                Spacer()
                
            }
            .frame(width: 100, height: 100)
            .background(Color("SecondaryColor"))
            .cornerRadius(6)
        }
        .foregroundColor(.white)
        .contextMenu{
            VStack {
                Button(action: {
                    /*
                     Lance la page de mofication
                     */
                    //setActualCollection(newCollection: actualColleciton)
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
                    
                    DispatchQueue.global(qos: .userInteractive).async {
                        managedObjectContext.delete(actualCards)
                        let id = CardController.getIdFromAList(obj: actualCards, list: cards)
                        cards.remove(at: id)
                        
                        PersistenceController.shared.save()
                        
                        //On actualise le nombre de carte
                        collectionParent.nbCards = Int64(collectionParent.collectionRelation!.count)
                        
                        PersistenceController.shared.save()
                    }
                    
                    
        
                    
                    
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
            Spacer()
            Text(collectionParent.name ?? "No name")
                .font(.system(.largeTitle))
                .padding()
                .foregroundColor(Color("TitleColor"))
            
            
            ScrollView(.vertical){
                LazyVGrid(columns: [GridItem(.flexible(maximum:110)),GridItem(.flexible(maximum:110)),GridItem(.flexible(maximum:110))],spacing: 10){
                    
                    ForEach(cards){
                        card in categoryCard(card)
                    }
                    
                }
            }
            .padding(.top,100)
            
            CommonViewElements.actionBarAtBottom(actionPlus: {
                addCardOn = true
                
            })
            .padding(.bottom)
            .sheet(isPresented: $addCardOn){
                //Ouvre le formulaire d'ajout
                FormAddCard(shouldQuit: $addCardOn,collectionParent: $collectionParent,cardToShow: $cards)
                    .environment(\.managedObjectContext, managedObjectContext)
            }/*.sheet(isPresented: $modifyCollection){
                //Ouvre le formulaire de modification
                FormModifyView(shouldQuit: $modifyCollection,colToModify: $whichCollection)
                    .environment(\.managedObjectContext, managedObjectContext)
            }*/
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
