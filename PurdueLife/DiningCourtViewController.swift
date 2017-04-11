//
//  DiningCourtViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 3/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON
import MBProgressHUD

class DiningCourtViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var sectionTitles: [String] = []
    var menuItems: [[FoodItem?]] = []
    var data: JSON? {
        didSet{
            getData()
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    var meals : [[FoodItem]] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mealLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.set(1,forKey: "meal")
        defaults.synchronize()
        tableView.delegate = self
        tableView.dataSource = self
        MBProgressHUD.showAdded(to: self.view, animated: true)
        //getData()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        menuItems.removeAll()
        sectionTitles.removeAll()

        //print(data)
        let meals = data?["Meals"].arrayValue
        //print(meals)
        let defaults = UserDefaults.standard
        let mealValue = defaults.integer(forKey: "meal")
        
        switch mealValue{
        case 1:
            //print("here")
            //print(meals![1])
            let lunch = meals![1]
            let stations = lunch["Stations"].arrayValue
            //print(lunch)
            
            for station in stations{
                                  //print(station["Name"].stringValue)
                self.sectionTitles.append(station["Name"].stringValue)
                let section = station["Items"].arrayValue
                var temp: [FoodItem?] = []
                for eachItem in section{
                    let idvItemInfo = FoodItem(json : eachItem)
                    temp.append(idvItemInfo)
                    //                        print("\t \(item["Name"].stringValue)")
                }
                self.menuItems.append(temp)
                
            }
        case 0:
            let breakfast = meals![0]
            let stations = breakfast["Stations"].arrayValue
            
            for station in stations{
                //                    print(items["Name"].stringValue)
                self.sectionTitles.append(station["Name"].stringValue)
                let section = station["Items"].arrayValue
                var temp: [FoodItem?] = []
                for eachItem in section{
                    let idvItemInfo = FoodItem(json : eachItem)
                    temp.append(idvItemInfo)
                    //                        print("\t \(item["Name"].stringValue)")
                }
                self.menuItems.append(temp)
            }
        case 2:
            let dinner = meals![2]
            let stations = dinner["Stations"].arrayValue
            
            for station in stations{
                //                    print(items["Name"].stringValue)
                self.sectionTitles.append(station["Name"].stringValue)
                let section = station["Items"].arrayValue
                var temp: [FoodItem?] = []
                for eachItem in section{
                    let idvItemInfo = FoodItem(json : eachItem)
                    temp.append(idvItemInfo)
                    //                        print("\t \(item["Name"].stringValue)")
                }
                self.menuItems.append(temp)
            }
        default:
            let lunch = meals?[1].arrayValue
            
            for station in lunch!{
                //                    print(items["Name"].stringValue)
                self.sectionTitles.append(station["Name"].stringValue)
                let section = station["Items"].arrayValue
                var temp: [FoodItem?] = []
                for eachItem in section{
                    let idvItemInfo = FoodItem(json : eachItem)
                    temp.append(idvItemInfo)
                    //                        print("\t \(item["Name"].stringValue)")
                }
                self.menuItems.append(temp)
            }
        }
        self.tableView.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodItemCell", for: indexPath) as! FoodItemCell
        
        let row = indexPath.row
        
        guard let itemInfo = menuItems[indexPath.section][row] else {
            return cell
        }
        //print("\(itemInfo.name)")
        
        cell.nameLabel.text = itemInfo.name
        //        cell.name2.text = itemInfo.name
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < sectionTitles.count {
            return sectionTitles[section]
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Change the selected background view of the cell.
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func onRight(_ sender: Any) {
        let defaults  = UserDefaults.standard
        let mealValue = defaults.integer(forKey: "meal")
        
        switch mealValue {
        case 1:
            defaults.set(2,forKey: "meal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Dinner"
        case 0:
            defaults.set(1,forKey: "meal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Lunch"
        case 2:
            defaults.set(0,forKey: "meal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Breakfast"
        default:
            print("error with switch")
        }

    }

    @IBAction func onLeft(_ sender: Any) {
        let defaults  = UserDefaults.standard
        let mealValue = defaults.integer(forKey: "meal")
        
        switch mealValue {
        case 1:
            defaults.set(0,forKey: "meal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Breakfast"
        case 0:
            defaults.set(2,forKey: "meal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Dinner"
        case 2:
            defaults.set(1,forKey: "meal")
            defaults.synchronize()
            getData()
            self.mealLabel.text = "Lunch"
        default:
            print("error with switch")
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! FoodItemCell
        
        let destination = segue.destination as! FoodItemViewController
        
        let section = self.tableView.indexPath(for: cell)?.section
        
        let row = self.tableView.indexPath(for: cell)?.row
        
        let info = menuItems[section!][row!]
        
        destination.id = info!.id
        
        
                
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
