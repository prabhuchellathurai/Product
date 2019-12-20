//
//  ViewController.swift
//  ProductDomo
//
//  Created by Prabhu on 20/12/19.
//  Copyright © 2019 tringapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var viewModel : ProductsListViewModel = ProductsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.loadProducts()
    }

    private func setup() {
        title = "Products"
        table.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: ProductListTableViewCell.reuseIdentifier)
        viewModel.trigger = { [weak self] (products, error) in
            DispatchQueue.main.async {
             self?.table.reloadData()
            }
        }
    }

}



extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.reuseIdentifier) as! ProductListTableViewCell
        let product = viewModel.itemAtIndex(index: indexPath)
        cell.viewModel = product
        cell.fillDetails()
        return cell
    }
    
}
