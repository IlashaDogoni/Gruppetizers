//
//  NetworkManagerTests.swift
//  GruppetizersTests
//
//  Created by Ilya Kokorin on 11.11.2024.
//

import Foundation

import XCTest
@testable import Gruppetizers


class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManager!

    override func setUp() {
        super.setUp()
        networkManager = NetworkManager.shared
    }

    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }

    func testGetGruppetizersSuccess() {
        let expectation = self.expectation(description: "Completion handler invoked")
        
        networkManager.getGruppetizers { result in
            switch result {
            case .success(let gruppetizers):
                XCTAssertNotNil(gruppetizers)
                XCTAssertGreaterThan(gruppetizers.count, 0) // Assuming you expect some items
            case .failure(let error):
                XCTFail("Expected success but got error: \(error)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testGetGruppetizersInvalidURL() {
        // You can modify the URL in your NetworkManager to trigger this case
        // For example, set an invalid URL and test the failure case
    }
}
