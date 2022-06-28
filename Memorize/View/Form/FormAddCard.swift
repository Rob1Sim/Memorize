//
//  FormAddCard.swift
//  Memorize
//
//  Created by Robin Simonneau on 28/06/2022.
//

import SwiftUI

struct FormAddCard: View {
    
    ///Permert la manipulations de donnée dans la mémoire
    @Environment(\.managedObjectContext) var managedObjectContext
    
    ///Champs de la question
    @State var question = ""
    ///Champs du supplément de la question
    @State var supQuestion = ""
    ///Champs de la réponse
    @State var response = ""
    ///Champs du suplément de la réponse
    @State var supResponse = ""
    
    ///Variable qui dit si la vue doit être afficher ou pas
    @Binding var shouldQuit:Bool
    
    ///Variable qui référence la collection parente
    @Binding var collectionParent:CollectionEntity
    
    ///Variable qui contient le tableau qui est affiché dans la vue des carte de la collection
    @Binding var cardToShow:Array<CardsEntity>
    /**
     Ajoute une carte a la mémoire
     */
    func addToMemory()->Void{
        
        if question != "" && response != ""{
            DispatchQueue.global(qos: .userInteractive).async {
                let cardEntity = CardsEntity(context: managedObjectContext)
                cardEntity.id = UUID()
                cardEntity.question = question
                cardEntity.questionSup = supQuestion
                cardEntity.response = response
                cardEntity.responseSup = supResponse
                
                
                cardEntity.cardRelation = collectionParent
                collectionParent.addToCollectionRelation(cardEntity)
                cardToShow.append(cardEntity)
                collectionParent.nbCards = Int64(collectionParent.collectionRelation!.count)
                
                //Permet de sauvegarder juste après un ajout
                if managedObjectContext.hasChanges {
                    PersistenceController.shared.save()
                }
            }
            shouldQuit.toggle()
        }
        
    }
    
    var body: some View {
        VStack{
            Form{
                Section{
                    Text("Ajoutez une nouvelle carte")
                        .font(.title2)
                    
                }
                Section{
                    
                    HStack {
                        Text("Question: ")
                        TextField("Quel est la capital des USA ?", text: $question)
                    }
                    HStack {
                        Text("Suplément :")
                        TextField("Indice ça finit par DC", text: $supQuestion)
                    }
                    HStack {
                        Text("Réponse : ")
                        TextField("Washington DC", text: $response)
                    }
                    HStack {
                        Text("Suplément de réponse : ")
                        TextField("Et pas NewYork", text: $supResponse)
                    }
                }
                Button(action: addToMemory){
                    Text("Ajouter")
                }
                
            }
            
        }.background(Color("BackgroundColor"))
    }
}

/*
 struct FormAddCard_Previews: PreviewProvider {
     static var previews: some View {
         FormAddCard(shouldQuit: .constant(true),collectionParent: .constant(CollectionEntity()))
     }
 }
 */
