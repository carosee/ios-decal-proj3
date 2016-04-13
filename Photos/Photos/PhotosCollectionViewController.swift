//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
        self.collectionView?.backgroundColor = UIColor.whiteColor()
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos == nil {
            return 0
        }
        return photos.count
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("something", forIndexPath: indexPath) as! PhotosCollectionViewCell
        let url = NSURL(string: photos[indexPath.row].standardURL)!
        cell.image.image = UIImage(data: NSData(contentsOfURL: url)!)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationView = segue.destinationViewController as! ImageDetailViewController
        if let cell = sender as? UICollectionViewCell {
            let indexPath = collectionView!.indexPathForCell(cell)!
            let photo = photos[indexPath.row]
            destinationView.photo = photos[indexPath.row]
        }
    }

    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let url = NSURL(string: photo.thumbURL)!
        imageView.image = UIImage(data: NSData(contentsOfURL: url)!)
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

