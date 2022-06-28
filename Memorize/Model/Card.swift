//
//  File.swift
//  Memorize
//
//  Created by Robin Simonneau on 22/06/2022.
//

import Foundation

/**
 Structure servant de modele pour les Card
 - Note pour l'instant non-utlisé
 */
class Card: Identifiable{
    ///id de la carte
    internal let id:UUID = UUID()
    ///Question de la carte
    private var question:String
    ///suplément de question de la carte, peut être `nil`
    private var supQuestion:String?
    ///Reponse de la carte
    private var reponse:String
    ///suplément de réponse de la carte, peut être `nil`
    private var supResponse:String?
    ///Score de la carte
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
                - returns  id
     **/
    public func getId()->UUID{
        return id
    }
    
    /**
                Recupère la question de la carte
                - returns  question
     **/
    public func getQuestion()->String{
        return question
    }
    
    /**
                Recupère le supplément de la carte
                - returns le suplément de question (peut être nil)
     **/
    public func getSupQuestion()->String?{
        return supQuestion
    }
    
    /**
                Recupère la réponse de la carte
                - returns la réponse
     **/
    public func getReponse()->String{
        return reponse
    }
    
    /**
                Recupère le supplément de réponse de la carte
                - returns le suplément de réponse (peut être nil)
     **/
    public func getSupResponse()->String?{
        return supResponse
    }
    
    /**
                Recupère le score de la carte
                - returns le score
     **/
    public func getScore()->Int{
        return score
    }
    
    
    
    /**
                Modifie la question de la carte
                - Parameter value : La nouvelle question
     **/
    public func setQuestion(value q:String)->Void{
        question = q
    }
    
    /**
                Modifie la question de la carte
                - Parameter value : Le nouveau supplément de question
     **/
    public func setSupQuestion(value q:String)->Void{
        supQuestion = q
    }
    
    /**
                Modifie la question de la carte
                - Parameter value : La nouvelle réponse
     **/
    public func setReponse(value r:String)->Void{
        reponse = r
    }
    
    /**
                Modifie la question de la carte
                - Parameter value : Le nouveau supplément de réponse
     **/
    public func setSupResponse(value r:String)->Void{
        supResponse = r
    }
    
    /**
     Modifie la valeur de score, est privé car elle est utlisé seulement dans la méthode statique
     - Parameter value : Le nouveau score
     */
    
    private func setScore(newScore:Int)->Void{
        self.score = newScore
    }
    
    /**
    Si l'utilisateur répond bien alors son score augmente sinon il repars a 0
     - Parameter isGood: Booléan qui si est vrai signifie que l'utilisateur a bien répondue
     - Parameter card : Instance de la carte a modifié
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
