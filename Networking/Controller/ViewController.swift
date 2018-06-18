//
//  ViewController.swift
//  Networking
//
//  Created by Shweta Shendage on 18/06/18.
//  Copyright © 2018 Shweta Shendage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var serviceType: UILabel!
  @IBOutlet weak var serviceCategory: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var productId: UILabel!
  let service = ServiceClass()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Product Info"
    let language = Locale.preferredLanguages[0]
    service.getProducts() { productInfo, errorMessage in
      
      self.activityIndicator.stopAnimating()
      
      
      
       if errorMessage.isEmpty == false {
        
       }else{
        self.productId.text = "Product ID: " + String(describing: productInfo.product.productid)
        self.serviceCategory.text = "Service Category: " + productInfo.product.characteristics.service_category
        self.serviceType.text = "Service Type: " + productInfo.product.services[0].servicetype

        var arrayOfLocalizedContent: [Localizedcontent] = productInfo.product.localizedcontent
        arrayOfLocalizedContent = arrayOfLocalizedContent.filter({
          $0.locale == language
        })
        guard arrayOfLocalizedContent.isEmpty == false else{
          return
        }
        self.name.text = "Name: " + arrayOfLocalizedContent[0].name
      }
      
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
}

