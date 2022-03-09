//
//  JahezTestTests.swift
//  JahezTestTests
//
//  Created by Mughees Mustafa on 08/03/2022.
//

import XCTest
@testable import JahezTest

class JahezTestTests: XCTestCase {

    func test_givenValidResourceExists_dataIsReturned() {
            let service = NetworkService()
            let expectation = self.expectation(description: "resource")
            var resourceData: Data?
            var resourceError: Error?
            let request = MockRequest(url: URL(string: "https://www.google.com")!)
            service.get(request: request) { (result) in
                switch result {
                case .success(let data):
                    resourceData = data
                case .failure(let error):
                    resourceError = error
                }
                
                expectation.fulfill()
            }
            
            waitForExpectations(timeout: 10, handler: nil)
            
            XCTAssertNil(resourceError)
            XCTAssertNotNil(resourceData)
        }

}
private struct MockRequest: Request {
    var urlRequest: URLRequest {
        return URLRequest(url: url)
    }
    
    var url: URL
}
