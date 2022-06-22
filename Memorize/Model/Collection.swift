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
    
    
    private func getId()->Int{
        return self.id
        
    }
    
    private func getName()->String{
        return self.name
    }
    
    private func getCards()->Array<Card>{
        return self.cards
    }
    
    private mutating func setName(value n:String)->Void{
        self.name = n
    }
}
