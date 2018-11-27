//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Student on 13/11/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    @IBOutlet weak var detailTextLabel: UILabel!
    
    var menuItem: MenuItem! = MenuItem(
        id: 0,
        name:"",
        detailText: "",
        price:0,
        category:"",
        imageURL: URL(string: "https://apple.com")!
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.layer.cornerRadius = 5
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
    }
    
    @IBAction func orderButtonTapped(_ button: UIButton) {
        UIView.animate(withDuration: 0.3){
            button.transform = CGAffineTransform(scaleX: 3, y: 3)
            button.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        MenuController.shared.order.menuItems.append(menuItem)
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
