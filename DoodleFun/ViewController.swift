//
//  ViewController.swift
//  DoodleFun
//
//  Created by Simon Ng on 19/1/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var doodleImages = ["DoodleIcons-1", "DoodleIcons-2", "DoodleIcons-3", "DoodleIcons-4", "DoodleIcons-8", "DoodleIcons-5", "DoodleIcons-6", "DoodleIcons-7", "DoodleIcons-9", "DoodleIcons-10", "DoodleIcons-11", "DoodleIcons-12", "DoodleIcons-16", "DoodleIcons-20", "DoodleIcons-13", "DoodleIcons-17", "DoodleIcons-14", "DoodleIcons-18", "DoodleIcons-15", "DoodleIcons-19"]
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return doodleImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        cell.imageView.image = UIImage(named: doodleImages[indexPath.row])
        
        return cell
    }
    
    // make cells adaptive - decrease size of cells in portrait mode to 80x80
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let sideSize = (traitCollection.horizontalSizeClass == .Compact && traitCollection.verticalSizeClass == .Regular) ? 80.0 : 128.0
        
        return CGSize(width: sideSize, height: sideSize)
    }
    
    // respond to size and trait changes
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
    
}

