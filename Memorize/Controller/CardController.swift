//
//  CardController.swift
//  Memorize
//
//  Created by Robin Simonneau on 28/06/2022.
//

import Foundation

/**
 Struct qui s'occupe de la gestion des donnée de la vue des carte
 */
struct CardController{
    
    /**
     Fonction qui met a jour le nombre de carte présente dans la collections quand on en crée une nouvelle
     - parameter collectionParent : Collection a mettre a jour
     - note: Il utilise le thread d'arrière plan le resultat est traité a coté
     */
    public static func actualizeCollection(collectionParent:CollectionEntity)->Void{
        
        //Permet d'éxécuté des actions sur un autre thread du processeur
        DispatchQueue.global(qos: .background).async {
            collectionParent.nbCards = collectionParent.nbCards + 1
            PersistenceController.shared.save()
        }
        
    }
}
