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
        JsonLoader.loadGenerics { (res: Response<[Product]>) in
            switch res {
            case .Success(let products):
                self.products = products
                self.trigger?(self.products, nil)
            case .Failure(let error):
                self.trigger?([], error)
            }
        }
    }
    
    func count() -> Int {
        return products.count
    }
    
    func itemAtIndex(index: IndexPath) -> ProductListCellViewModel {
        let product = products[index.row]
        let model = ProductListCellViewModel(product: product)
        return model
    }
    
}
