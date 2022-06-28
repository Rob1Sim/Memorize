//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @Environment(\.scenePhase) var scenePhase
    ///Enregiste le controlleur persistant
    let persistenceController = PersistenceController.shared
    

    var body: some Scene {
        WindowGroup {
            
            CollectionView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //Permet d'ataché le coredata (ce qui me sert a enregistré dans la mémoire) a l'ui
            
        }.onChange(of: scenePhase){
            _ in persistenceController.save()
            //Permet de sauvegardé les changment à chaque mofification de l'application
        }
        
    }
}
