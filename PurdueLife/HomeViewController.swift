//
//  HomeViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 3/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftDate

class HomeViewController: UIViewController {
    
    var food : [FoodItem] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = DateInRegion()
        let dateString = date.string(format: .custom("MM-dd-yyyy"))
        
        

                
        
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.barTintColor = UIColor.black
        self.tabBarController?.tabBar.tintColor = UIColor.white
        
        //self.tabBarController?.tabBarItem. = UIColor.white
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
