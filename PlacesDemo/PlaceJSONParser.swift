//
//  PlaceJSONParser.swift
//  PlacesDemo
//
//  Created by julie.yaunches on 3/22/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Place {
    var name: String
    var rating: String
    var imageURL: String?
    var address: String
    var openNow: Bool
    
}

class PlaceJSONParser: NSObject {
    static func createFrom(incomingJSON: SwiftyJSON.JSON) -> [Place] {
        var resultPlaces: [Place] = []

        let jsonPlaces = incomingJSON["results"].array

        print(jsonPlaces)
        
        for subJSON in jsonPlaces! {
            if let name = subJSON["name"].rawString(),
               let rating = subJSON["rating"].rawString(),
                let address = subJSON["vicinity"].rawString(),
                let openNow = subJSON["opening_hours"]["open_now"].bool
            {
                var place = Place(name: name, rating: rating, imageURL: nil, address: address, openNow: openNow)
                let firstPhoto = subJSON["icon"].rawString()
                
                place.imageURL = firstPhoto

                resultPlaces.append(place)
                
            }
            
            
        }
        return resultPlaces
    }
}