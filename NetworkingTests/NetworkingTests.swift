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
  var serviceUnderTest : ServiceClass!

  override func setUp() {
    super.setUp()
    sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    serviceUnderTest = ServiceClass()
    serviceUnderTest.defaultSession = URLSession(configuration: .default)
  }
  
  override func tearDown() {
    sessionUnderTest = nil
    serviceUnderTest = nil
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
  
  func testCheckIfDataParsedCorrectly(){
    
    let makeExpectation = expectation(description: "Status code: 200")
    
    let url = URL(string: NWConstants.NWProductServiceURL)
    let dataTask = serviceUnderTest?.defaultSession.dataTask(with: url!) {
      data, response, error in
      if let error = error {
        print(error.localizedDescription)
      } else if let httpResponse = response as? HTTPURLResponse {
        if httpResponse.statusCode == 200 {
          self.serviceUnderTest?.createProductModel(data!)
          makeExpectation.fulfill()
        }
      }
    }
    dataTask?.resume()
    waitForExpectations(timeout: 60, handler: nil)
    XCTAssert(serviceUnderTest?.productWrapper != nil)
  }
  
}
