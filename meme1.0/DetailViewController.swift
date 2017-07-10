//
//  DetailViewController.swift
//  meme1.0
//
//  Created by Rishav on 23/04/17.
//  Copyright © 2017 Rishav. All rights reserved.
//

import UIKit
import Foundation

class DetailViewController: UIViewController {

        var memes: Meme2!
        @IBOutlet weak var im: UIImageView!
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        im.image = memes.memedImage
        self.tabBarController?.tabBar.isHidden = true
        
    }
}
