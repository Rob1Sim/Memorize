//
//  MemorizeTestsCollectionController.swift
//  MemorizeTests
//
//  Created by Robin Simonneau on 23/06/2022.
//

import XCTest
@testable import Memorize

class MemorizeTestsCollectionController: XCTestCase {

    let testCard = Card(question: "Test", reponse: "Réponse de test")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /*
     Test la suppréssion d'une collection dans une liste de collection par son id
     */
    /*func testDeleteCollection() throws{
        var collectionList:Array<Collection> = []
        for i in 0...10{
            collectionList.append(Collection(name: "Test\(i)", cards: [testCard]))
        }
        var id = collectionList[Int.random(in: 0...10)].getId()
        
        try XCTAssertNoThrow(CollectionController.deleteCollection(id: id, collections: &collectionList))
        id = UUID()
        try XCTAssertThrowsError(CollectionController.deleteCollection(id: id, collections: &collectionList), "\(id) ne fait pas partie des collections de la list il doit renvoyer une erreur")

    }*/

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
