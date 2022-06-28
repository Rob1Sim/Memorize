//
//  FormAddView.swift
//  Memorize
//
//  Created by Robin Simonneau on 24/06/2022.
//

import SwiftUI

struct FormAddView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    @State var textInput = ""
    @Binding var shouldQuit:Bool
    
    func addToMemory()->Void{
        
        let collectionEntity = CollectionEntity(context: managedObjectContext)
        collectionEntity.name = textInput
        collectionEntity.id = UUID()
        collectionEntity.nbCards = 0
        //Permet de sauvegarder juste après un ajout
        if managedObjectContext.hasChanges {
            PersistenceController.shared.save()
        }
        shouldQuit.toggle()
    }
    
    
    var body: some View {
        VStack{
            Form{
                Section{
                    Text("Ajoutez une collection")
                        .font(.title2)
                    Text("Entrez un nom de la nouvelle connexion")
                        .font(.caption)
                }
                Section{
                    TextField("Entrez le nom", text: $textInput)
                }
                Button(action: addToMemory){
                    Text("Ajouter")
                }
                
            }
            
        }.background(Color("BackgroundColor"))
    }
}

