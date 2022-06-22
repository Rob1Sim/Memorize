//
//  File.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import Foundation


class Card: Identifiable{
    internal let id:UUID = UUID()
    private var question:String
    private var supQuestion:String?
    private var reponse:String
    private var supResponse:String?
    private var score:Int = 0;
    
    /*
     Constructeur
     */
    init(question:String, reponse:String,supQuestion:String? = nil, supResponse:String? = nil){
        self.question = question
        self.supQuestion = supQuestion
        self.reponse = reponse
        self.supResponse = supResponse
        
    }
    
    /**
                Recupère l'id de la carte
                return Int id
     **/
    public func getId()->UUID{
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
    public func setQuestion(value q:String)->Void{
        question = q
    }
    
    /**
                Modifie la question de la carte
                String value : Le nouveaux supplément de question
     **/
    public func setSupQuestion(value q:String)->Void{
        supQuestion = q
    }
    
    /**
                Modifie la question de la carte
                String value : La nouvelle réponse
     **/
    public func setReponse(value r:String)->Void{
        reponse = r
    }
    
    /**
                Modifie la question de la carte
                String value : Le nouveau suplément de réponse
     **/
    public func setSupResponse(value r:String)->Void{
        supResponse = r
    }
    
    /*
     Modifie la valeur de score, est privé car elle est utlisé seulement dans la méthode statique
     Int newScore : Score a actualisé
     */
    
    private func setScore(newScore:Int)->Void{
        self.score = newScore
    }
    
    /*
    Si l'utilisateur répond bien alors son score augmente sinon il repars a 0
     Bool isGood : Booléan qui si est vrai signifie que l'utilisateur a bien répondue
     Card card : Instance de la carte a modifié
     */
    public static func calculScore(card:Card ,isGood:Bool)->Void{
        var n = 0
        if (isGood){
            n =  card.getScore() + 1
            card.setScore(newScore:n)
            
        }else{
            
            card.setScore(newScore:n)
        }
        
    }
    
    
}
