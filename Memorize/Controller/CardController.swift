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
    
    /**
     Cherche dans une liste l'index d'un élement cherché
     - Parameter obj L'objet que l'on cherche dans la liste
     - Parameter list La liste dans laquel on recherche
     - Returns L'index de l'élément dans la liste
     */
    public static func getIdFromAList(obj:AnyObject,list:Array<AnyObject>)->Int{
        var res = -1
        for i in 0...list.count-1{
            if list[i] === obj{
                res = i
            }
        }
        return res
    }
    
}
