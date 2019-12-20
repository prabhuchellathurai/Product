//
//  ProductsListViewModel.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

typealias Trigger = ([Product], Error?) -> Void

class ProductsListViewModel {
    
    private var products: [Product] = []
    var trigger: Trigger?
    
    func loadProducts() {
        
        JsonLoader.load { (products: [Product]?, error: Error?) in
            if products != nil {
                self.products = products!
                self.trigger?(self.products, error)
            } else {
                self.trigger?([], error)
            }
        }
        
    }
    
    func count() -> Int {
        return products.count
    }
    
    func itemAtIndex(index: IndexPath) ->Product {
        return products[index.row]
    }
    
}
