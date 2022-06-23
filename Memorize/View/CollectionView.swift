//
//  ContentView.swift
//  memorApp
//
//  Created by Robin Simonneau on 19/06/2022.
//

import SwiftUI

struct CollectionView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    
    //permet de récuperer dnas la mémoire par ordre alphabétique toute les collectionEntity
    @FetchRequest(sortDescriptors: [SortDescriptor(\.nbCards)]) var collectionsE: FetchedResults<CollectionEntity>

    /*
     @State var collections = [Collection( name: "Japonais", cards: [Card( question: "question", reponse: "Réponse")])]
     */
    
    
    @State var collectionController = CollectionController()
    /**
                Créer un petit carrée rose qui représente une liste
                String titre : Le nom de la liste
                int nbElment : le nombre d'élément que contient cette liste
                return some View : Un carré rose qui représente une liste
     */
    fileprivate func categoryComp(_ title: String, _ nbElement:Int64) ->some View {
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
    
    
    
    /*
        Fonction qui test l'ajout de collections en cliquant sur le bouton blanc
     */
    private func testCollection()->Void{
    
        //Permet d'ajouter des collection en mémoire
        let col = CollectionEntity(context: managedObjectContext)
        col.name = "connard"
        col.id = UUID()
        col.nbCards = 32
        //Permet de sauvegarder juste après un ajout
        if managedObjectContext.hasChanges {
            PersistenceController.shared.save()
        }

    }
    
    
    
    var body: some View {
       
        VStack {
            Spacer()
            Text("Accueil")
                .font(.system(.largeTitle))
                .padding()
                .foregroundColor(Color("TitleColor"))
                
            
            ScrollView(.vertical){
                LazyVGrid(columns: [GridItem(.flexible(maximum:110)),GridItem(.flexible(maximum:110)),GridItem(.flexible(maximum:110))],spacing: 10){
                    
                     ForEach(collectionsE){
                         collection in categoryComp(collection.name ?? "Aucun nom", collection.nbCards)
                     }
                     

                    
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
                Button(action:testCollection){
                    
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
                
            }.padding(.bottom)
        
        }
        
        .background(Color("BackgroundColor"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
            .preferredColorScheme(.dark)
    }
}
