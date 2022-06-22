//
//  File.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import Foundation


struct Card{
    private let id:Int
    private var question:String
    private var supQuestion:String?
    private var reponse:String
    private var supResponse:String?
    private var score:Int = 0;
    
    /**
                Recupère l'id de la carte
                return Int id
     **/
    public func getId()->Int{
        return id
    }
    
    /**
                Recupère la question de la carte
                return String question
     **/
    public func getQuestion()->String{
        return question
    }
    
    /**
                Recupère le supplément de la carte
                return String? supQuestion
     **/
    public func getSupQuestion()->String?{
        return supQuestion
    }
    
    /**
                Recupère la réponse de la carte
                return String reponse
     **/
    public func getReponse()->String{
        return reponse
    }
    
    /**
                Recupère le supplément de réponse de la carte
                return String? supReponse
     **/
    public func getSupResponse()->String?{
        return supResponse
    }
    
    /**
                Recupère le score de la carte
                return Int score
     **/
    public func getScore()->Int{
        return score
    }
    
    
    
    /**
                Modifie la question de la carte
                String value : La nouvelle question
     **/
    public mutating func setQuestion(value q:String)->Void{
        question = q
    }
    
    /**
                Modifie la question de la carte
                String value : Le nouveaux supplément de question
     **/
    public mutating func setSupQuestion(value q:String)->Void{
        supQuestion = q
    }
    
    /**
                Modifie la question de la carte
                String value : La nouvelle réponse
     **/
    public mutating func setReponse(value r:String)->Void{
        reponse = r
    }
    
    /**
                Modifie la question de la carte
                String value : Le nouveau suplément de réponse
     **/
    public mutating func setSupResponse(value r:String)->Void{
        supResponse = r
    }
    
    
    
    
    
}
