//
//  ProductDetailViewModel.swift
//  ProductDomo
//
//  Created by Prabhu on 21/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailViewModel {
    
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var name: String {
        return product.name
    }
    
    var price: String {
        return product.price
    }
    
    var description: String {
        guard let description = product.desc else {
            return ""
        }
        return description
    }
    
    var image: UIImage? {
        guard let url = product.image else {
            return UIImage.placeHolder()
        }
        let image = ImageCache.instance.imageForProduct(url: url)
        return image
    }
}
