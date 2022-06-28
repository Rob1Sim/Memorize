//
//  FormModifyView.swift
//  Memorize
//
//  Created by Robin Simonneau on 26/06/2022.
//

import SwiftUI

/**
 Vue qui permet de modifier une collection du téléphone
 */
struct FormModifyView: View {
    ///Permert la manipulations de donnée dans la mémoire
    @Environment(\.managedObjectContext) var managedObjectContext
    
    ///Valeur du champ d'entré
    @State var textInput = ""
    ///Variable qui dit si la vue doit être afficher ou pas
    @Binding var shouldQuit:Bool
    ///Référence à la collections qui va être modifié
    @Binding var colToModify:CollectionEntity
    
    /**
     Modifie dans la mémoire la carte selectionnée
     
     */
    func modify()->Void{
        
        if textInput != ""{
            colToModify.name = textInput
            if managedObjectContext.hasChanges {
                PersistenceController.shared.save()
            }
            shouldQuit.toggle()
        }
    }
    
    ///Contenue de la vue
    var body: some View {
        VStack{
            Form{
                Section{
                    Text("Modifiez une collection")
                        .font(.title2)
                    Text("Entrez le nouveau nom de la collection")
                        .font(.caption)
                }
                Section{
                    TextField("Entrez le nom", text: $textInput)
                }
                Button(action: modify){
                    Text("Modifiez")
                }
                
            }
            
        }.background(Color("BackgroundColor"))
    }
}

/*
 struct FormAddView_Previews: PreviewProvider {
     
     static var previews: some View {
         
         FormAddView()
     }
 }

 */

