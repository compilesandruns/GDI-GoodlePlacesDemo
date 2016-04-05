//
//  PlacesTableViewController.swift
//  PlacesDemo
//
//  Created by julie.yaunches on 3/22/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

import Foundation
import UIKit

class CustomTVC : UITableViewCell {
    
    @IBOutlet weak var locImage: UIImageView!
    @IBOutlet weak var locName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var openNow: UILabel!
    
}


class PlacesTableViewController: UITableViewController {
    var places: [Place]?

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlaceCell") as! CustomTVC!

        if let places = places {
            let place = places[indexPath.row]
            cell.locName?.text = place.name
            cell.rating?.text = place.rating + " stars"
            cell.address?.text = place.address
            if place.openNow == true {
                cell.openNow?.text = "Open"
                cell.openNow?.textColor = UIColor.greenColor()
            }
            else {
                cell.openNow?.text = "Closed"
                cell.openNow?.textColor = UIColor.redColor()


            }
            
           
            if let image = place.imageURL,
                let nsURL = NSURL(string: image){
                    
                let data = NSData(contentsOfURL: nsURL)
                cell.locImage?.image =  UIImage(data: data!)
                    
            }
            

        }
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "detailSegue") {
        
            let destinationVC = segue.destinationViewController as! CustomVC
            
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                
                    destinationVC.place = places![indexPath.row]
            }
    
        }
}
