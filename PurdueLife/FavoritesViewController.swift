//
//  FavoritesViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/4/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class FavoritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var favorites: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let defaults  = UserDefaults.standard
        
        var favorites = defaults.stringArray(forKey: "favorites")
        
        if favorites == nil{
           print("dne")
        }else{
            self.favorites = favorites!
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults  = UserDefaults.standard

        var favorites = defaults.stringArray(forKey: "favorites")
        
        if favorites == nil{
            print("dne")
        }else{
            self.favorites = favorites!
        }
        tableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteFoodCell", for: indexPath) as! FavoriteFoodCell
        
        let row = indexPath.row
        
        let name = favorites[row]
        
        
        cell.nameLabel.text = name
        //        cell.name2.text = itemInfo.name
        
        
        
        // Configure the cell...
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! FavoriteFoodCell
        
        let destination = segue.destination as! FavoriteFoodViewController
        
        let row = self.tableView.indexPath(for: cell)?.row
        
        let name = favorites[row!]
        
        print(name)
        
       
       
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
