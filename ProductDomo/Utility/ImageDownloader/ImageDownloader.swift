//
//  ImageDownloader.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    
    static func downloadImage(url: String, block: @escaping  (Response<UIImage>) -> Void) {
        
        guard let newUrl = URL(string: url) else {
            return block(Response.Failure(Errors.Invalid))
        }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: newUrl) { (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                block(Response.Failure(Errors.Invalid))
                return
            }
            ImageCache.instance.addImage(url: url, image: image)
            block(Response.Success(image))
        }
        
        task.resume()
    }
    
}
