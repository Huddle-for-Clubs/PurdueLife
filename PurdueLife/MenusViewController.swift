//
//  MenusViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 3/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class MenusViewController: UIViewController {
    
    var food : JSON?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "wileySegue"{
         
            let destination = segue.destination as! DiningCourtViewController
            
            APIClient.sharedInstance.getMenu(diningCourt: "Wiley",date: "3-31-2017",success: {(items: JSON) in
                self.food = items
                //print(items)
                destination.data = self.food!
                
            }, error: { (error: Error) in
                print(error.localizedDescription)
                
            })

            
        }
        
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
