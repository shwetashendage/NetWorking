//
//  ViewController.swift
//  Networking
//
//  Created by Shweta Shendage on 18/06/18.
//  Copyright © 2018 Shweta Shendage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let service = ServiceClass()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Product Info"
    service.getProducts() { results, errorMessage in
      
      
      if let results = results{
        
        
      } else if errorMessage.isEmpty == false {
        
        
      }
      
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
}

