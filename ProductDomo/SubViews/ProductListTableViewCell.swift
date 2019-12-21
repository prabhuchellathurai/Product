//
//  ProductListTableViewCell.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import UIKit


class ProductListTableViewCell: UITableViewCell {

    static let reuseIdentifier = "ProductListTableViewCell"
    @IBOutlet weak private var name: UILabel!
    @IBOutlet weak private var price: UILabel!
    @IBOutlet weak private var wishlist: UILabel!
    @IBOutlet weak private var stepper: UIStepper!
    @IBOutlet weak  private var productImageView: UIImageView!
    var viewModel : ProductListCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func loadImage() {
        viewModel.trigger = { [weak self] (image) in
            DispatchQueue.main.async {
                self?.productImageView.image = image
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favorite(sender: UIStepper) {
        wishlist.text = "\(Int(sender.value))"
        viewModel.addToWishlist(count: Int(sender.value))
    }
    
    
    func fillDetails() {
        name.text = viewModel.name
        price.text = viewModel.price
        price.textColor = viewModel.color
        productImageView.image = viewModel.image
        stepper.value = viewModel.stepperCount
        wishlist.text = "\(viewModel.count)"
        loadImage()
    }
    
}
