//
//  IndvItemViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/12/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class IndvItemViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
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
    
    let sectionTitles = ["Nutrition Facts","Allergens","Ingredients"]
    var sectionContents: [[String]] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100

        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadInfo(){
//        nameLabel.text = self.info?.name
//        allergenLabel.text = self.info?.allergens
//        ingredientsTextView.text = self.info?.ingrediants
        print(self.info?.allergens)
        let temp1: [String] = (self.info?.allergenArray)!
        let temp2: [String] = [(self.info?.ingrediants) ?? ""]
        let temp3: [String] = (self.info?.nutritionArrray)!
        
        sectionContents.append(temp3)
        sectionContents.append(temp1)
        sectionContents.append(temp2)
        
        print(info!.name)
        
        self.title = info?.name
        print(sectionContents.count)
        self.tableView.reloadData()
        //print("here")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IndvItemCell", for: indexPath) as! IndvItemCell
        
        let row = indexPath.row
        
        let section = indexPath.section
        
        let data = sectionContents[section][row]
        
        
        cell.nameLabel.text = data
        //        cell.name2.text = itemInfo.name
        
        
        
        // Configure the cell...
        
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionContents.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return sectionContents[section].count
        
        
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


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
