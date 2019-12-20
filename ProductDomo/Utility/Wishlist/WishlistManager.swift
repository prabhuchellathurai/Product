//
//  WishlistManager.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

final class WishlistManager {
    
    private var list: [WishlistItem] = []
    //private var userdefault: UserDefaults = UserDefaults.standard
    private let wishlistKey = "wishlist"
    
    init() {
        fetchList()
    }
    
    private func fetchList() {
        let userdefault: UserDefaults = UserDefaults.standard
        let decoded  = userdefault.data(forKey: wishlistKey)
        guard let decode = decoded else {
            return
        }

        list = NSKeyedUnarchiver.unarchiveObject(with: decode) as! [WishlistItem]
        
    }
    
    func addToWishlist(pid: String, count: Int) {
        
        list.removeAll { (list) -> Bool in
            list.pid == pid
        }
        
        let wishlist =  WishlistItem(pid: pid, count: count)
        list.append(wishlist)
        
        do {
            let userdefault: UserDefaults = UserDefaults.standard
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: list, requiringSecureCoding: false)
            userdefault.set(encodedData, forKey: wishlistKey)
            let saved = userdefault.synchronize()
            saved ? print("Saved") : print("Not saved")
        } catch {
            debugPrint("Wishlist retrieve error")
        }
    }
    
    func valueForItem(pid: String) -> WishlistItem {
        let item = list.first(where: { $0.pid == pid})
        guard let result = item else {
            return WishlistItem(pid: pid, count: 0)
        }
        return result
    }
    
    private func isExist(pid: String) -> WishlistItem? {
        let item = list.first(where: { $0.pid == pid})
        return item
    }
    
}
