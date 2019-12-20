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
    private var wishlistManager: WishlistManager = WishlistManager()
    private var productImage: UIImage = UIImage(named: "product_image")!
    var trigger: ImageTrigger?
    
    init(product: Product) {
        self.product = product
        imageDownload()
    }
    
    private func imageDownload() {
        
        guard isloaded == false else {
            return
        }
        
        guard let url = product.image else {
            return
        }
        
        ImageDownloader.downloadImage(url: url) { [weak self] (response: Response<UIImage>) in
            self?.isloaded = true
            switch response {
                case .Success(let image):
                    self?.productImage = image
                    self?.trigger?(image)
                case .Failure(_):
                    self?.productImage = UIImage(named: "product_image")!
            }
        }
        
    }
    
    var name: String {
        return product.name
    }
    
    var price: String {
        if product.offerPrice != nil {
            return product.offerPrice!
        } else {
            return product.price
        }
    }
    
    var image: UIImage {
        return productImage
    }
    
    var color: UIColor {
        if product.offerPrice != nil {
            return UIColor.orange
        } else {
            return UIColor.black
        }
    }
    
    func addToWishlist(count: Int) {
        wishlistManager.addToWishlist(pid: product.pid, count: count)
    }
    
    func getCount() -> Int {
        let item = wishlistManager.valueForItem(pid: product.pid)
        return item.count
    }
}
