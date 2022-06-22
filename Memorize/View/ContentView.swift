//
//  ContentView.swift
//  memorApp
//
//  Created by Robin Simonneau on 19/06/2022.
//

import SwiftUI

struct ContentView: View {
        
    @State private var isEditing:Bool = false
    
    /**
                Créer un petit carrée rose qui représente une liste
                String titre : Le nom de la liste
                int nbElment : le nombre d'élément que contient cette liste
                return some View : Un carré rose qui représente une liste
     */
    fileprivate func categoryComp(_ title: String, _ nbElement:Int) -> some View {
        return VStack{
    
            Text(title)
                .font(.system(.title2))
                .padding([.top, .leading])
                .frame(width: 100, height: 30, alignment: .leading)
            
                
            Text("\(nbElement) Elements")
                .font(.system(size: 14,weight: .light))
                .padding([.top, .leading])
                .frame(width: 100, height: 10, alignment: .leading)
            Spacer()
            
        }
        .frame(width: 100, height: 100)
        .background(Color("SecondaryColor"))
        .cornerRadius(6)


        .contextMenu{
            VStack {
                Button(action: {}) {
                    HStack{
                        Text("Modifier")
                        Image(systemName: "pencil")
                            
                    }
                }
                Button(action: {}) {
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
    
    private func onEdit()->Void{
        isEditing.toggle()
    }
    
    
    
    var body: some View {
       
        VStack {
            Spacer()
            Text("Accueil")
                .font(.system(.largeTitle))
                .padding()
                .foregroundColor(Color("TitleColor"))
                Spacer()
            
            ScrollView(.vertical){
                LazyVGrid(columns: [GridItem(.flexible(maximum:110)),GridItem(.flexible(maximum:110)),GridItem(.flexible(maximum:110))],spacing: 10){
                    categoryComp("test",22)
                    categoryComp("test",22)
                    categoryComp("test",22)
                    categoryComp("test",22)
                    categoryComp("test",22)
                    categoryComp("test",22)
                    categoryComp("test",22)
                    categoryComp("test",22)
                    categoryComp("test",22)
                   


                    
                }
            }
            .padding(.top,100)
            
            Spacer()
            HStack{
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
                Button(action:{}){
                    
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
                
            }
        
        }
        
        .background(Color("BackgroundColor"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
