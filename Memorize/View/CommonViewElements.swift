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
    public static func actionBarAtBottom(leftIcon:String = "cart", middleIcon:String = "plus.circle.fill" ,rightIcon:String = "gearshape",actionPlus actionB:@escaping ()->Void = {})->some View {
        
        
        return HStack{
            Spacer()
            Button(action: {}){
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width:40,height: 40)
                        .foregroundColor(Color("SecondaryColor"))
                    Image(systemName: leftIcon)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:28,height: 28)
                    
                }.padding(.horizontal,8)
            }
            Spacer()
            Button(action:actionB){
                
                Image(systemName: middleIcon)
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
                    Image(systemName: rightIcon)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:30,height: 30)
                    
                }.padding(.horizontal,8)
                
            }
            Spacer()
        }
        
    }
    
    /**
     Barre d'action en bas de l'écran
     
     - Parameter actionPlus:`()->Void` : Action que le bouton croix doit executer quand on clique dessus
     - returns `some View` : Retourne une vue
     */
    public static func actionBarAtBottomPlay(actionPlus actionP:@escaping ()->Void = {}, actionPlay:@escaping ()->Void = {}, actionEdit:@escaping ()->Void = {})->some View {
        
        
        return HStack{
            Spacer()
            Button(action: actionP){
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width:40,height: 40)
                        .foregroundColor(Color("SecondaryColor"))
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:20,height: 20)
                    
                }.padding(.horizontal,8)
            }
            Spacer()
            Button(action:actionPlay){
                
                Image(systemName: "play.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color("TitleColor"))
                
            }
            
            
            Spacer()
            Button(action: actionEdit){
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width:40,height: 40)
                        .foregroundColor(Color("SecondaryColor"))
                    Image(systemName: "pencil")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:20,height: 20)
                    
                }.padding(.horizontal,8)
                
            }
            Spacer()
        }
        
    }
}


