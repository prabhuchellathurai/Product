//
//  WishlistManager.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation

final class WishlistManager {
    
    static let instance: WishlistManager = WishlistManager()
    private var list: [WishlistItem] = []
    private let userDefault: UserDefaults
    private let wishlistKey = "wishlist"
    
    init(userDefault: UserDefaults = .standard) {
        self.userDefault = userDefault
        fetchList()
    }
    
    private func fetchList() {
        let decoded  = userDefault.data(forKey: wishlistKey)
        guard let decode = decoded else {
            return
        }

        let val = NSKeyedUnarchiver.unarchiveObject(with: decode) as? [WishlistItem]
        list = val!
    }
    
    func addToWishlist(pid: String, count: Int) {
       let item = fetchProductUsing(pid: pid)
        if let product = item {
            product.count = count
        } else {
            let wishlist =  WishlistItem(pid: pid, count: count)
            list.append(wishlist)
        }
        
        saveList()
    }
    
    private func saveList() {
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
        let item = fetchProductUsing(pid: pid)
        guard let result = item else {
            return WishlistItem(pid: pid, count: 0)
        }
        return result
    }
    
    private func fetchProductUsing(pid: String) -> WishlistItem? {
        let item = list.first(where: { $0.pid == pid})
        return item
    }
    
}
