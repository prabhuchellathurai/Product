//
//  Product.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

class Product: Decodable {
    let pid: String
    let name: String
    let price: String
    let offerPrice: String?
    let image: String?
    let desc: String?
    
    init(pid:String, name:String, price: String, offerPrice: String, desc: String, image: String?) {
        self.pid = pid
        self.name = name
        self.price = price
        self.offerPrice = offerPrice
        self.image = image
        self.desc = desc
    }
    
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(Int.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//        lastName = try container.decode(String.self, forKey: .lastName)
//        age = try container.decode(Int.self, forKey: .age)
//    }
    
}
