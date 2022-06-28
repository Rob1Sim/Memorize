//
//  CardCollectionView.swift
//  Memorize
//
//  Created by Robin Simonneau on 27/06/2022.
//

import SwiftUI

struct CardCollectionView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //Bindings de la collection
    @Binding var collectionParent:CollectionEntity
    
    //permet de récuperer dnas la mémoire par ordre alphabétique toute les collectionEntity
    @FetchRequest(sortDescriptors: [SortDescriptor(\.question)]) var collectionsE: FetchedResults<CardsEntity>
    
    

    //Variable qui si vrai doit ouvir une page
    @State var addCardOn = false
    
    
    
    var body: some View {
        
                
        VStack {
            Spacer()
            Text(collectionParent.name ?? "No name")
                .font(.system(.largeTitle))
                .padding()
                .foregroundColor(Color("TitleColor"))
            
            
            ScrollView(.vertical){
                LazyVGrid(columns: [GridItem(.flexible(maximum:110)),GridItem(.flexible(maximum:110)),GridItem(.flexible(maximum:110))],spacing: 10){
                    
                    //Foreach
                    
                    
                    
                }
            }
            .padding(.top,100)
            
            CommonViewElements.actionBarAtBottom(actionPlus: {
                addCardOn = true
            })
            .padding(.bottom)
            /*.sheet(isPresented: $addCollectionOn){
                //Ouvre le formulaire d'ajout
                FormAddView(shouldQuit: $addCollectionOn)
                    .environment(\.managedObjectContext, managedObjectContext)
            }.sheet(isPresented: $modifyCollection){
                //Ouvre le formulaire de modification
                FormModifyView(shouldQuit: $modifyCollection,colToModify: $whichCollection)
                    .environment(\.managedObjectContext, managedObjectContext)
            }*/
            Spacer()
            
            //Code executé quand la vue apparait
        }.onAppear(perform: {
            
        })
        .background(Color("BackgroundColor"))
        
    }
}

struct CardCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardCollectionView(collectionParent: .constant(CollectionEntity()))
    }
}
