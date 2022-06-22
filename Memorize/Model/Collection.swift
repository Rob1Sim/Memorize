//
//  Collection.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import Foundation


struct Collection{
    private let id:Int
    private var name:String
    private var cards:Array<Card>
    private var nbCard:Int{
        get{
            return cards.count
        }
    }
    
    init(id:Int, name:String, cards:Array<Card>){
        self.id = id
        self.name = name
        self.cards = cards
    }
    
    /**
                Recupère l'id de la carte
                return Int id
     **/
    private func getId()->Int{
        return self.id
        
    }
    
    /**
                Recupère le nom de la carte
                return String name
     **/
    private func getName()->String{
        return self.name
    }
    
    /**
                Recupère les cartes présente dans la collection
                return Array<card> cards
     **/
    private func getCards()->Array<Card>{
        return self.cards
    }
    
    /**
                Modifie le nom avec le nom passé en paramètre
                String n Nom
     **/
    private mutating func setName(value n:String)->Void{
        self.name = n
    }
}
