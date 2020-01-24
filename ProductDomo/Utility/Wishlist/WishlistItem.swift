//
//  WishlistItem.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

class WishlistItem: NSObject, NSCoding {
    let pid: String
    var count: Int
    
    init(pid: String, count: Int) {
        self.pid = pid
        self.count = count
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let pid = aDecoder.decodeObject(forKey: "pid") as? String
        let count = aDecoder.decodeInteger(forKey: "count")
        self.init(pid: pid!, count: count)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(pid, forKey: "pid")
        aCoder.encode(count, forKey: "count")
    }
    
}
