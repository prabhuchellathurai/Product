//
//  ProductListCellViewModel.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation
import UIKit

typealias ImageTrigger = (UIImage) -> Void

class ProductListCellViewModel {
    private var product: Product
    private var isloaded: Bool = false
    private var wishlistManager = WishlistManager.instance
    private var productImage: UIImage? = UIImage.placeHolder()
    var trigger: ImageTrigger?
    
    init(product: Product) {
        self.product = product
        imageDownload()
    }
    
    private func imageDownload() {
        
        guard !isloaded, let url = product.image else {
            return
        }
        
        isloaded = true
        
        ImageDownloader.downloadImage(url: url) { [weak self] (response: Response<UIImage>) in
            switch response {
                case .Success(let image):
                    self?.productImage = image
                    self?.trigger?(image)
                case .Failure(_):
                    self?.productImage = UIImage.placeHolder()
            }
        }
    }
    
    private func hasOffer() -> Bool {
        guard let offerPrice = product.offerPrice, !offerPrice.isEmpty else {
            return false
        }
        return true
    }
    
    var name: String {
        return product.name
    }
    
    var price: String {
        guard let offerPrice = product.offerPrice, !offerPrice.isEmpty else {
            return product.price
        }
        return offerPrice
    }
    
    var image: UIImage? {
        return productImage
    }
    
    var color: UIColor {
        return hasOffer() ? .orange : .black
    }
    
    func addToWishlist(count: Int) {
        wishlistManager.addToWishlist(pid: product.pid, count: count)
    }
    
    var count: Int {
        let item = wishlistManager.valueForItem(pid: product.pid)
        return item.count
    }
    
    var  stepperCount: Double {
        return Double(count)
    }
}
