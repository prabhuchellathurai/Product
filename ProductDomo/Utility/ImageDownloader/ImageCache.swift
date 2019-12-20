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
    
    static var instance: ImageCache = ImageCache()
    private var cache: [String: UIImage] = [:]
    
    private init() {
        
    }
    
    func addImage(url: String, image: UIImage) {
        cache[url] = image
    }
    
    func imageForId(url: String) -> UIImage? {
        return cache[url] ?? nil
    }
    
}
