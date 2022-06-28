//
//  FormAddView.swift
//  Memorize
//
//  Created by Robin Simonneau on 24/06/2022.
//

import SwiftUI

/**
 Vue qui permet d'ajouté une collection a la mémoire du téléphone
 */
struct FormAddView: View {
    ///Permert la manipulations de donnée dans la mémoire
    @Environment(\.managedObjectContext) var managedObjectContext
    
    ///Valeur du champ d'entré
    @State var textInput = ""
    ///Variable qui dit si la vue doit être afficher ou pas
    @Binding var shouldQuit:Bool
    
    /**
     Ajoute une collection a la mémoire
     */
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
    
    ///Contenue de la vue
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

