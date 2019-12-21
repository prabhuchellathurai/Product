//
//  ImageCache.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation
import UIKit

final class ImageCache {
    
    static let instance: ImageCache = ImageCache()
    private var cache: [String: UIImage] = [:]
    
    func addImage(url: String, image: UIImage) {
        cache[url] = image
    }
    
    func imageForId(url: String) -> UIImage? {
        return cache[url] ?? nil
    }
    
    func imageForProduct(url: String) -> UIImage? {
        return cache[url] ?? nil
    }
    
}
