//
//  TableViewController.swift
//  meme1.0
//
//  Created by Rishav on 31/03/17.
//  Copyright © 2017 Rishav. All rights reserved.
//
import Foundation
import UIKit

class tableViewController: UITableViewController {
    var memes: [Meme2] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
      
        
            }
    @IBAction func add(_ sender: AnyObject) {
        let Controller = storyboard!.instantiateViewController(withIdentifier: "meme2")
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = true
        self.navigationController!.pushViewController(Controller, animated: true)
    }
    
   

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        self.tableView.reloadData()
    }


        override func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.memes.count
        }
    override func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellView") as! tableView
        let meme = memes[indexPath.row]
        cell.ImageView.image = meme.memedImage
        cell.Label.text = meme.top
        cell.subTitle.text = meme.bottom
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = storyboard!.instantiateViewController(withIdentifier: "Show") as! DetailViewController
        
        let meme = memes[indexPath.row]
        detailController.memes = meme
        let backButton = UIBarButtonItem()
        backButton.title = "Table View"
        navigationItem.backBarButtonItem = backButton
        navigationController?.pushViewController(detailController, animated: true)
        
        
    }

}



