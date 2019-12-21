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
        let nib = UINib(nibName: "ProductListTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: ProductListTableViewCell.reuseIdentifier)
        viewModel.trigger = { [weak self] (products, error) in
            DispatchQueue.main.async {
                self?.table.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == ProductDetailViewController.segueIdentifier, let index = sender as? IndexPath {
            let detailViewController = segue.destination as? ProductDetailViewController
            let product = viewModel.indexOfItem(index: index)
            detailViewController?.viewModel = ProductDetailViewModel(product: product)
        }
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.reuseIdentifier) as! ProductListTableViewCell
        let productViewModel = viewModel.itemAtIndex(index: indexPath)
        cell.viewModel = productViewModel
        cell.fillDetails()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: ProductDetailViewController.segueIdentifier, sender: indexPath)
    }
    
}
