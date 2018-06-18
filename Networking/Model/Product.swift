//
//  Product.swift
//  Networking
//
//  Created by Shweta Shendage on 18/06/18.
//  Copyright © 2018 Shweta Shendage. All rights reserved.
//

import Foundation
struct ProductWrapper: Codable {
  let product: Product
  
}
struct Product: Codable {
  let productid: Int
  let characteristics: Characterstick
  let localizedcontent: [Localizedcontent]
  let services: [Services]

}
struct Characterstick: Codable {
    let service_category: String
}
struct Localizedcontent: Codable {
  let name: String
  let locale: String
}
struct Services: Codable {
  let servicetype: String
}
