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
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    var product: Product!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillDetails() {
        name.text = product.name
        if product.offerPrice != nil {
            price.text = product.offerPrice
            price.textColor = UIColor.orange
        } else {
            price.text = product.price
        }
        productImageView.image = UIImage(named: "product_image")
    }
    
}
