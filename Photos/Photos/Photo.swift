//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    var likes : Int!
    var username : String!
    var thumbURL : String!
    var standardURL : String!
    var date : String!
    var liked : Bool!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        username = data.valueForKey("user")?.valueForKey("username") as! String
        likes = data.valueForKey("likes")?.valueForKey("count") as! Int
        thumbURL = data.valueForKey("images")?.valueForKey("thumbnail")?.valueForKey("url") as! String
        standardURL = data.valueForKey("images")?.valueForKey("standard_resolution")?.valueForKey("url") as! String
        date = data.valueForKey("created_time") as! String
        liked = false
    }

}