//
//  ImageDetailViewController.swift
//  Photos
//
//  Created by Carolyn Sy on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    @IBOutlet weak var imgview: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var likes: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var likebutton: UIButton!
    
    var photo : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: photo!.standardURL)!
        var image = UIImage(data: NSData(contentsOfURL: url)!)
        var numLikes = photo!.likes
        imgview.image = image
        likes.text = String(numLikes!)
        username.text = photo!.username
        self.likebutton.addTarget(self, action: "tapLike", forControlEvents: .TouchUpInside)
        
        var s = String(NSDate(timeIntervalSince1970: Double(photo!.date)!))
        var i = s.startIndex.advancedBy(5)
        s = s.substringFromIndex(i)
        i = s.startIndex.advancedBy(5)
        date.text = s.substringToIndex(i)
        
        if (photo!.liked!) {
            likebutton.setImage(UIImage(named: "afterlike.jpg"), forState: .Normal)
            self.likes.text = String(photo!.likes! + 1)
        }
    }
    
    func tapLike() {
        photo!.liked! = !(photo!.liked!)
        if (photo!.liked!) {
            likebutton.setImage(UIImage(named: "afterlike.png"), forState: .Normal)
            self.likes.text = String(photo!.likes! + 1)
        } else {
            likebutton.setImage(UIImage(named: "beforelike.png"), forState: .Normal)
            likes.text = String(photo!.likes!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
