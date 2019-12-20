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
        let session = URLSession(configuration: .default)
        let newUrl = URL(string: url)!
        let task = session.dataTask(with: newUrl) { (data, response, error) in
            if data != nil {
                let image = UIImage(data: data!)
                ImageCache.instance.addImage(url: url, image: image!)
                block(Response.Success(image!))
            } else {
                block(Response.Failure(error!))
            }
        }
        task.resume()
    }
    
}
