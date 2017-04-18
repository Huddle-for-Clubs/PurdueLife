//
//  FoodItemViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/4/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class FoodItemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var info: FoodDetail?
    
    var nutInfo: [JSON] = []
    var id : String? {
        didSet{
            APIClient.sharedInstance.getItemInfo(id: self.id!, success: { (info: JSON) in
                self.info = FoodDetail(json: info)
                //print("here")
                self.info = FoodDetail(json: info)
                self.nutInfo = (self.info?.nutrition)!
                self.loadInfo()
                
                
            }) { (error: Error) in
                print(error.localizedDescription)
            }

        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var allergenLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
       
        
        
        

        // Do any additional setup after loading the view.
        loadInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInfo(){
        nameLabel.text = self.info?.name
        allergenLabel.text = self.info?.allergens
        ingredientsTextView.text = self.info?.ingrediants
        self.tableView.reloadData()
        //print("here")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.nutInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        
        let row = indexPath.row
        
        let data = nutInfo[row]
        
        cell.nameLabel.text = "\(data["Name"].stringValue): \(data["LabelValue"].stringValue)"
        //        cell.name2.text = itemInfo.name
        
        
        
        // Configure the cell...
        
        return cell
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
