//
//  MemorizeTests.swift
//  MemorizeTests
//
//  Created by Robin Simonneau on 23/06/2022.
//

import XCTest
@testable import Memorize

/**
 Class qui gère des tests de base sur la créations de collections
 */
class MemorizeTestsCards: XCTestCase {
    
    let testCard = Card(question: "Test", reponse: "Réponse de test")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /**
     Réalise des test pour voir si la création d'une carte fonctionne bien
     - throws une erreur si le score n'est pas égale a ce qu'il devrait être
     */
    func testCreateCard() throws{
        
        XCTAssertNil(testCard.getSupQuestion(), "Le supplément de question n'est pas renseigné il doit être nill")
        XCTAssertNil(testCard.getSupResponse(), "Le supplément de réponse n'est pas renseigné il doit être nill")
        XCTAssertEqual(testCard.getQuestion(), "Test")
        XCTAssertEqual(testCard.getReponse(), "Réponse de test")
        
    }
    
    /**
     Réalise des test pour voir si le score est bien mis a jour comme il faut
     - throws une erreur si le score n'est pas égale a ce qu'il devrait être
     */
    func testModifyCardScore() throws{
        Card.calculScore(card: testCard, isGood: true)
        XCTAssertEqual(testCard.getScore(), 1)
        Card.calculScore(card: testCard, isGood: false)
        XCTAssertEqual(testCard.getScore(), 0)
        
        var nbTest = 0
        for i in 0...100{
            Card.calculScore(card: testCard, isGood: true)
            nbTest = i
        }
        XCTAssertEqual(testCard.getScore(), nbTest+1)
        
    }
    
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
