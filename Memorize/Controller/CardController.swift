//
//  CardController.swift
//  Memorize
//
//  Created by Robin Simonneau on 28/06/2022.
//

import Foundation

struct CardController{
    
    /*
     Fonction qui met a jour le nombre de carte présente dans la collections quand on en crée une nouvelle
     CollectionEntity collectionParent : Collection a mettre a jour
     */
    public static func actualizeCollection(collectionParent:CollectionEntity)->Void{
        
        //Permet d'éxécuté des actions sur un autre thread du processeur
        DispatchQueue.global(qos: .background).async {
            collectionParent.nbCards = collectionParent.nbCards + 1
            PersistenceController.shared.save()
        }
        
    }
}
