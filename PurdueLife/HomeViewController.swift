//
//  HomeViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 3/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var food : [FoodItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.sharedInstance.getMenu(diningCourt: "Wiley",date: "3-31-2017",success: {(items: [FoodItem]) in
            self.food = items
            
        }, error: { (error: Error) in
            print(error.localizedDescription)
            
        })
        
        
        
//        var todaysDate:Date = Date()
//        var dateFormatter:DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
//        var DateInFormat:String = dateFormatter.string(from: todaysDate)
//        print(DateInFormat)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
