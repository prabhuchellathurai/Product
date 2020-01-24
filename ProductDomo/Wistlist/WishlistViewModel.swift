//
//  ProductDetailsViewModel.swift
//  ProductDomo
//
//  Created by Prabhu on 21/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

class WishlistViewModel {
    private let product: Product
    private let products: [Product]
    
    init(product: Product, products: [Product]) {
        self.product = product
        self.products = products
    }
    
    var item: String {
        let items = products.filter { (product) -> Bool in
            product.name == self.product.name
        }
        return "\(items.count)"
    }
    
    var savings: String {
        guard let offerprice = product.offerPrice else {
            return "$\(product.price)"
        }
        
        var originalPrice = product.price
        originalPrice = originalPrice.replaceSpecialCharacter()
        var offPrice = offerprice
        offPrice = offPrice.replaceSpecialCharacter()
        
        if let price = Double(originalPrice), let offer = Double(offPrice) {
            return "\(price-offer)"
        }
        
        return "$0"
        
    }
    
    var total: String {
        return "$\(product.price)"
    }
    
}

extension String {
    
    mutating func replaceSpecialCharacter() -> String {
        self = self.replacingOccurrences(of: "$", with: "")
        self = self.replacingOccurrences(of: ",", with: "")
        return self
    }
}
