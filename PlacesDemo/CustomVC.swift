//
//  CustomVC.swift
//  PlacesDemo
//
//  Created by Stephanie on 3/29/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

import UIKit

class CustomVC: UIViewController {
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var openNowLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    var place: Place?
    
    override func viewDidLoad() {
    
        nameLabel.text = place!.name
        ratingLabel.text = place!.rating
        addressLabel.text = place!.address
//        openNowLabel.text = place!.openNow st
    }
    
    
    

    @IBAction func dismissButton(sender: UIButton) {
    }
}
