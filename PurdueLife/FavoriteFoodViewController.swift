//
//  FavoriteFoodViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/4/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class FavoriteFoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var name: String?{
        didSet{
            APIClient.sharedInstance.getAhead(name: name!, success: { (info: JSON) in
                print(info)
                self.info = info
                self.loadData()
                
            }) { (error: Error) in
                print(error.localizedDescription)
            }

        }
    }
    
    var info : JSON?
    var appearences : [ScheduleInfo] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = self.name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(){
        let results = self.info?["Results"].arrayValue
        
        if let results = results{
            
            for result in results{
                let itemSchedule = result["ItemSchedule"]
                let itemAppearance = itemSchedule["ItemAppearance"].arrayValue
                
                for apperance in itemAppearance{
                    let temp = ScheduleInfo(json : apperance)
                    appearences.append(temp)
                }
            }
            
            print(appearences.count)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appearences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteDetailCell", for: indexPath) as! FavoriteDetailCell
        
        let row = indexPath.row
        
        let info = appearences[row]
        
        
        cell.locationLabel.text = info.location
        cell.dateLabel.text = info.date
        cell.mealLabel.text = info.meal
        cell.stationLabel.text = info.station
        //        cell.name2.text = itemInfo.name
        
        
        
        // Configure the cell...
        
        return cell
    }

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//       
//    }
    

}
