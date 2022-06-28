//
//  FormModifyView.swift
//  Memorize
//
//  Created by Robin Simonneau on 26/06/2022.
//

import SwiftUI

struct FormModifyView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    @State var textInput = ""
    @Binding var shouldQuit:Bool
    @Binding var colToModify:CollectionEntity
    
    /*
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

