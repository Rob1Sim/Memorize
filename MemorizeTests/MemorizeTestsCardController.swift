//
//  MemorizeTestsCardController.swift
//  MemorizeTests
//
//  Created by Robin Simonneau on 28/06/2022.
//

import XCTest
@testable import Memorize

class MemorizeTestsCardController: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /**
     Test la fonction getIdFromList
     */
    func testGetIdFromAList() throws{
        let card = Card(question: "t", reponse: "t")
        
        let list:Array<Card> = [card,Card(question: "e", reponse: "e"),Card(question: "f", reponse: "f"),Card(question: "d", reponse: "d"),Card(question: "c", reponse: "c")]
        
        
        
        
        var id = CardController.getIdFromAList(obj: card, list: list)
        
        XCTAssertEqual(id, 0)
        
        id = CardController.getIdFromAList(obj: Card(question: "tad", reponse: "tzd"), list: list)
        
        XCTAssertEqual(-1, id)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
