//
//  CommonViewElements.swift
//  Memorize
//
//  Created by Robin Simonneau on 27/06/2022.
// Fichier qui repertorie des partie de l'interface pour rendre le code plus clean

import SwiftUI

struct CommonViewElements {
    
    
    
    
    /*
     Espace ou apparaisse toutes les tuiles avec la possibilité de scroller pour toutes les voirs
     
     scrollViewContent:AnyView : Le contenue que doit afficher la vue, une boucle for pour afficher toutes les tuiles par exemple
     maxLenghtColumn:CGFloat : La taille maximum que peut prendre une colonne
     spaceBetweenColumn:CGFloat : L'espace qu'il doit y avoir entre deux colonnes
     paddingFromTheTop:CGFloat : La taille du padding depuis le haut de la case
     
     return some View: Retourne une vue
     */
    public static func scrollView(collectionType:Range<Int>, maxLenghtColumn mlc:CGFloat = 110, spaceBetweenColumn sbc:CGFloat = 10, paddingFromTheTop padTop:CGFloat = 100,functionOfFor:@escaping ()->AnyView)->some View{
        
        return ScrollView(.vertical){
            LazyVGrid(columns: [GridItem(.flexible(maximum:mlc)),GridItem(.flexible(maximum:mlc)),GridItem(.flexible(maximum:110))],spacing: sbc){
                
                //Trouver un moyen d'integrer une vue ici (fonction statique ?)
                
            }
        }
        .padding(.top,padTop)
    }
    
    
    /*
     Barre d'action en bas de l'écran
     
     actionPlus:()->Void : Action que le bouton croix doit executer quand on clique dessus
     return some View : Retourne une vue
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


