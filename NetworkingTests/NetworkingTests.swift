//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Shweta Shendage on 18/06/18.
//  Copyright © 2018 Shweta Shendage. All rights reserved.
//

import XCTest
@testable import Networking

class NetworkingTests: XCTestCase {
  
  var sessionUnderTest: URLSession!
  
  override func setUp() {
    super.setUp()
    sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
  }
  
  override func tearDown() {
    sessionUnderTest = nil
    super.tearDown()
  }
  
  func testsuccessfullCallToFactsGivesHTTPStatus200() {
    let url = URL(string: NWConstants.NWProductServiceURL)
    let makeExpectation = expectation(description: "Completion handler invoked")
    var statusCode: Int?
    var httpResponseError: Error?
    
    let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
      statusCode = (response as? HTTPURLResponse)?.statusCode
      httpResponseError = error
      makeExpectation.fulfill()
    }
    dataTask.resume()
    waitForExpectations(timeout: 60, handler: nil)
    
    XCTAssertNil(httpResponseError)
    XCTAssertEqual(statusCode, 200)
  }
  
}
