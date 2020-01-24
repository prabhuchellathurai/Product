//
//  ResponseError.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

enum Response<T> {
    case success(T), failure(Error)
}
