//
//  Collection.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import Foundation

/**
 Structure servant de modele pour la Collection
 - Note pour l'instant non-utlisé
 */
struct Collection: Identifiable{
    ///id de la collection
    internal let id = UUID()
    ///nom de la collection
    private var name:String
    ///Tableau des cartes  de la collection
    private var cards:Array<Card>
    ///nombre de carte de la collection
    public var nbCard:Int{
        get{
            return cards.count
        }
    }
    
    init(name:String, cards:Array<Card>){
        self.name = name
        self.cards = cards
    }
    
    /**
                Recupère l'id de la carte
                - returns Int id
     **/
    public func getId()->UUID{
        return self.id
        
    }
    
    /**
                Recupère le nom de la carte
                - returns  name
     **/
    public func getName()->String{
        return self.name
    }
    
    /**
                Recupère les cartes présente dans la collection
                - returns  cards
     **/
    public func getCards()->Array<Card>{
        return self.cards
    }
    
    /**
                Modifie le nom avec le nom passé en paramètre
                - Parameter n le nom
     **/
    public mutating func setName(value n:String)->Void{
        self.name = n
    }
}
