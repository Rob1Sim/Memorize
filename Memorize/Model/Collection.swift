//
//  Collection.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import Foundation


struct Collection: Identifiable{
    internal let id = UUID()
    private var name:String
    private var cards:Array<Card>
    private var nbCard:Int{
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
                return Int id
     **/
    public func getId()->UUID{
        return self.id
        
    }
    
    /**
                Recupère le nom de la carte
                return String name
     **/
    public func getName()->String{
        return self.name
    }
    
    /**
                Recupère les cartes présente dans la collection
                return Array<card> cards
     **/
    public func getCards()->Array<Card>{
        return self.cards
    }
    
    /**
                Modifie le nom avec le nom passé en paramètre
                String n Nom
     **/
    public mutating func setName(value n:String)->Void{
        self.name = n
    }
}
