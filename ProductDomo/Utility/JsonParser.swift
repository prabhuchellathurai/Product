//
//  JsonParser.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

class JsonParser {
    
    static func parse<T: Decodable>(data: Data) -> T {
        let decoder = JSONDecoder()
        // TODO: Change Unwrapped optional
        let result = try! decoder.decode(T.self, from: data)
        return result
    }
    
}
