//
//  FavoritesViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/4/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON
import Firebase

class FavoritesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var favorites: [String] = ["You have no favorites!"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let defaults  = UserDefaults.standard
        
//        var favorites = defaults.stringArray(forKey: "favorites")
//        
//        if favorites == nil{
//           print("dne")
//        }else{
//            self.favorites = favorites!
//        }

        var dataRef = FIRDatabase.database().reference()
        
        let user = FIRAuth.auth()?.currentUser
        
        let ref = dataRef.child("users").child((user?.uid)!)
        
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if(snapshot.hasChild("favorites")){
                print("Exists")
                let value = snapshot.value as? NSDictionary
                
                var favorites = value?["favorites"] as? [String]
                
                if let favorites = favorites{
                    self.favorites = favorites
                    self.tableView.reloadData()
                    
                }else{
                    print("Error with favorites")
                }
                //                var tempArray = (ref.child("favorites").value as? [String])
                //                tempArray.append(self.nameLabel.text!)
               
                
            }else{
//                let alert = UIAlertController(title: "Ooops!", message: "It looks like you don't have any likes!", preferredStyle: .alert)
//                
//                let ok = UIAlertAction(title: "OK", style: .cancel, handler: { (alert) in
//                    self.parent?.dismiss(animated: true, completion:{
//                        
//                    })
//                })
//                
//                alert.addAction(ok)
//                
//                self.present(alert, animated: true, completion: {
//                    
//                })

                
                print("doesnt")
                
            }
        })

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
        
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        
//        let defaults  = UserDefaults.standard
//
//        var favorites = defaults.stringArray(forKey: "favorites")
//        
//        if favorites == nil{
//            print("dne")
//        }else{
//            self.favorites = favorites!
//        }
        
        var dataRef = FIRDatabase.database().reference()
        
        let user = FIRAuth.auth()?.currentUser
        
        let ref = dataRef.child("users").child((user?.uid)!)
        
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if(snapshot.hasChild("favorites")){
                print("Exists")
                let value = snapshot.value as? NSDictionary
                
                var favorites = value?["favorites"] as? [String]
                
                if let favorites = favorites{
                    self.favorites = favorites
                    self.tableView.reloadData()
                    
                }else{
                    print("Error with favorites")
                }
                //                var tempArray = (ref.child("favorites").value as? [String])
                //                tempArray.append(self.nameLabel.text!)
                
                
            }else{
                print("doesnt")
                
            }
        })

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
        
        destination.name = name
        
//        print(name)
       
       
       
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
