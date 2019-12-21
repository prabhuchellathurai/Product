//
//  ProductDetailViewController.swift
//  ProductDomo
//
//  Created by Prabhu on 21/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailViewController: UIViewController {
    
    static let segueIdentifier = "productDetails"
    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var price: UILabel!
    @IBOutlet weak private var desc: UILabel!
    @IBOutlet weak private var productImageView: UIImageView!
    
    var viewModel: ProductDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = viewModel?.name
        price.text = viewModel?.price
        desc.text = viewModel?.description
        productImageView.image = viewModel?.image
    }
    
    
}
