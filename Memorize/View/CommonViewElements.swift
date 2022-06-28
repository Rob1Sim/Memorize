//
//  CommonViewElements.swift
//  Memorize
//
//  Created by Robin Simonneau on 27/06/2022.
// Fichier qui repertorie des partie de l'interface pour rendre le code plus clean

import SwiftUI

/**
 Différente méthode qui sont des composants de l'UI
 - Note Permet de ne pas dupliquer du code
 */
struct CommonViewElements {
    
    
    
    
    
    
    
    /**
     Barre d'action en bas de l'écran
     
     - Parameter actionPlus:`()->Void` : Action que le bouton croix doit executer quand on clique dessus
     - returns `some View` : Retourne une vue
     */
    public static func actionBarAtBottom(actionPlus actionB:@escaping ()->Void = {})->some View {
        
        
        return HStack{
            Spacer()
            Button(action: {}){
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width:40,height: 40)
                        .foregroundColor(Color("SecondaryColor"))
                    Image(systemName: "cart")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:28,height: 28)
                    
                }.padding(.horizontal,8)
            }
            Spacer()
            Button(action:actionB){
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color("TitleColor"))
                
            }
            
            
            Spacer()
            Button(action:{}){
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width:40,height: 40)
                        .foregroundColor(Color("SecondaryColor"))
                    Image(systemName: "gearshape")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:30,height: 30)
                    
                }.padding(.horizontal,8)
                
            }
            Spacer()
        }
        
    }
    
}


