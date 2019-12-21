//
//  JsonLoader.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

class JsonLoader {
    
    static func load<T:Decodable>(filename: String) -> [T]? {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else {
                    return nil
                }
                let url = URL(fileURLWithPath: path)
                let data = try! Data(contentsOf: url, options: .dataReadingMapped)
                let products: [T] = JsonParser.parse(data: data)
                return products
    }
    
    /*
     static func load<T:Decodable>(block: @escaping  (T?, Error?) -> Void)  {
         let session = URLSession(configuration: .default)
         let url = URL(string: "http://www.mocky.io/v2/5dfb59e72f00006200ff9e80")!
         let task = session.dataTask(with: url) { (data, response, error) in
             if data != nil {
                 //let data = try! Data(contentsOf: url, options: .dataReadingMapped)
                 let products: T = JsonParser.parse(data: data!)
                 block(products,nil)
             } else {
                 block(nil, error)
             }
         }
         task.resume()
     }
    */
    
    static func loadGenerics<T:Decodable>(block: @escaping  (Response<T>) -> Void)  {
        
        let session = URLSession(configuration: .default)
        let url = URL(string: "http://www.mocky.io/v2/5dfb59e72f00006200ff9e80")!
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let err = error else {
                let products: T = JsonParser.parse(data: data!)
                block(Response.Success(products))
                return
            }
            block(Response.Failure(err))
        }
        task.resume()
        
    }
}
