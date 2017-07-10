//
//  CollectionViewController.swift
//  meme1.0
//
//  Created by Rishav on 31/03/17.
//  Copyright © 2017 Rishav. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout:UICollectionViewFlowLayout!
    
    var memes: [Meme2] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    @IBAction func add(_ sender: AnyObject) {
        let meme = storyboard!.instantiateViewController(withIdentifier: "meme2")
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
        
        navigationController!.pushViewController(meme, animated: true)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        let spacex: CGFloat = 0.5
        let spacey: CGFloat = 0.5
        
        let dimensionx = (self.view.frame.width -  2*spacex)/3
        flowLayout.minimumLineSpacing = spacey
        flowLayout.minimumInteritemSpacing = spacex
        if self.view.frame.width < self.view.frame.height{
            flowLayout.itemSize = CGSize( width: dimensionx , height: dimensionx)}
        else{
            flowLayout.itemSize = CGSize( width: dimensionx/1.5 , height: dimensionx/1.5)
        }
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.collectionView?.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition( to: size, with: coordinator)
        
        
        let spacex: CGFloat = 0.5
        let spacey: CGFloat = 0.5
        let dimensionx = (size.width - 2*spacex)/3
        
        flowLayout.minimumLineSpacing = spacey
        flowLayout.minimumInteritemSpacing = spacex
        if size.width < size.height{
            flowLayout.itemSize = CGSize( width: dimensionx , height: dimensionx)}
        else{
            flowLayout.itemSize = CGSize( width: dimensionx/1.5 , height: dimensionx/1.5)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCollectionCellView", for: indexPath) as! memeCollectionCellView
        let meme = memes[indexPath.row]
        cell.memeImageView.image = meme.memedImage
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return memes.count
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailController = storyboard?.instantiateViewController(withIdentifier: "Show") as! DetailViewController
        let meme = memes[indexPath.row]
        detailController.memes = meme
        let leftBackButton = UIBarButtonItem()
        leftBackButton.title = "Collection View"
        navigationItem.backBarButtonItem = leftBackButton
        navigationController?.pushViewController(detailController, animated: true)
        

    }
    
}
