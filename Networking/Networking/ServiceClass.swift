//
//  ServiceClass.swift
//  ProofOfConcept
//
//  Created by Shweta Shendage on 21/05/18.
//  Copyright © 2018 Shweta Shendage. All rights reserved.
//

import Foundation

class ServiceClass {
  
  
  
  typealias JSONDictionary = [String: Any]
  typealias result = (JSONDictionary?, String) -> ()
  
  var defaultSession = URLSession(configuration: .default)
  var dataTask: URLSessionDataTask?
  
  var errorMessage = ""
  var dataDictinary: JSONDictionary = [:]
  
  func getProducts(completion: @escaping result) {
    
    //    Webservice call
    dataTask?.cancel()
    
    guard let url = URL(string: "https://api.prd.telenet.be/omapi/public/product/544") else {
      return
    }
    
    dataTask = defaultSession.dataTask(with: url) { data, response, error in
      defer {
        self.dataTask = nil
        
      }
      
      if let error = error {
        self.errorMessage += "Error cause: " + error.localizedDescription + "\n"
      } else if let data = data,
        let response = response as? HTTPURLResponse,
        response.statusCode == 200 {
        //        Parse Data
        self.createProductModel(data)
      }
      DispatchQueue.main.async {
        completion(self.dataDictinary, self.errorMessage)
      }
    }
    
    dataTask?.resume()
    
  }
  func createProductModel(_ data: Data) {
    
  }
  
}
