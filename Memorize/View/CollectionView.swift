//
//  ContentView.swift
//  memorApp
//
//  Created by Robin Simonneau on 19/06/2022.
//

import SwiftUI
import CoreData

/**
 Vue qui s'occupe d'afficher les collections, c'est aussi la vue d'accueil
 */
struct CollectionView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    
    //permet de récuperer dnas la mémoire par ordre alphabétique toute les collectionEntity
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var collectionsE: FetchedResults<CollectionEntity>

    
    //Variable qui si vrai doit ouvir une page
    @State var addCollectionOn = false
    
    //Variable qui contient la collection a modifier
    
    @State var whichCollection:CollectionEntity = CollectionEntity()
    @State var modifyCollection = false
    
    /*
     Selectionne la collection selectionné par l'utilisateur
     newCollection:CollectionEntity : LA nouvelle collection selectionné
     */
    public func setActualCollection(newCollection:CollectionEntity)->Void{
        whichCollection = newCollection
        modifyCollection.toggle()
    }
    
    //@State var collectionController = CollectionController()
    
    /**
     Créer un petit carrée rose qui représente une liste
     - Parameter titre : Le nom de la liste
     - Parameter nbElment : le nombre d'élément que contient cette liste
     - returns : `some View` Un carré rose qui représente une liste
     */
    fileprivate func categoryComp(_ title: String, _ nbElement:Int64, _  actualColleciton:CollectionEntity) ->some View {
        return Button(action: {}){
            VStack{
                
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
        }
        .foregroundColor(.white)
        .contextMenu{
            VStack {
                Button(action: {
                    /*
                     Lance la page de mofication
                     */
                    setActualCollection(newCollection: actualColleciton)
                }) {
                    HStack{
                        Text("Modifier")
                        Image(systemName: "pencil")
                        
                    }
                }
                Button(action: {
                    /*
                     Supprime de la mémoire la collection
                     */
                    managedObjectContext.delete(actualColleciton)
                    PersistenceController.shared.save()
                    
                }) {
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
    
    
    
    
    
    ///Contenue de la vue
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
                        collection in categoryComp(collection.name ?? "Aucun nom", collection.nbCards,collection)
                    }
                    
                    
                    
                }
            }
            .padding(.top,100)
            
            CommonViewElements.actionBarAtBottom(actionPlus: {
                addCollectionOn = true
            })
            .padding(.bottom)
            .sheet(isPresented: $addCollectionOn){
                //Ouvre le formulaire d'ajout
                FormAddView(shouldQuit: $addCollectionOn)
                    .environment(\.managedObjectContext, managedObjectContext)
            }.sheet(isPresented: $modifyCollection){
                //Ouvre le formulaire de modification
                FormModifyView(shouldQuit: $modifyCollection,colToModify: $whichCollection)
                    .environment(\.managedObjectContext, managedObjectContext)
            }
            Spacer()
            
            
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
