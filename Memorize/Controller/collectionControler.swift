//
//  collectionControler.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import Foundation


class CollectionControler{
    
    public var collections = [Collection( name: "Japonais", cards: [Card( question: "question", reponse: "Réponse")])]
    
    
    /*
     Supprime la collection d'id passé en paramètre de la list de collection passé en paramètre
     UUID id : L'id de la collection a supprimé
     Array<Collecion> : List de collection auquel on souhaite supprimer
     Throw indexNotInTheList si l'id ne correspond a aucune collecitons présent dans la liste
     */
    public static func deleteCollection(id:UUID,collections c:inout Array<Collection>) throws ->Void{
        var index = -1
        for i in 0...c.count-1{
            if c[i].getId() == id{
                index = i
            }
        }
        
        if index<0{
            throw OutOfIndexExeption.indexNotInTheList
        }else{
            c.remove(at: index)
        }
    }
}
