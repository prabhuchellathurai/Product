//
//  ProductDetailViewController.swift
//  ProductDomo
//
//  Created by Prabhu on 21/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController {

    
    @IBOutlet weak private var item: UILabel!
    @IBOutlet weak private var savings: UILabel!
    @IBOutlet weak private var total: UILabel!
    var viewModel: WishlistViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        item.text = viewModel?.item
        savings.text = viewModel?.savings
        total.text = viewModel?.total
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
