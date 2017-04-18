//
//  MenusViewController.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 3/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftDate

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let date = DateInRegion()
        let dateString = date.string(format: .custom("MM-dd-yyyy"))
        
        if segue.identifier == "wileySegue"{
         
            let destination = segue.destination as! DiningCourtViewController
            destination.diningCourt = "Wiley"
            APIClient.sharedInstance.getMenu(diningCourt: "Wiley",date: dateString,success: {(items: JSON) in
                self.food = items
                //print(items)
                destination.data = self.food!
                
                
            }, error: { (error: Error) in
                print(error.localizedDescription)
                
            })

            
        }else if segue.identifier == "fordSegue"{
            //print("ford")
            let destination = segue.destination as! DiningCourtViewController
            destination.diningCourt = "Ford"

            APIClient.sharedInstance.getMenu(diningCourt: "Ford",date: dateString,success: {(items: JSON) in
                self.food = items
                //print(items)
                destination.data = self.food!
                
            }, error: { (error: Error) in
                print(error.localizedDescription)
                
            })
        }else if segue.identifier == "earhartSegue"{
            let destination = segue.destination as! DiningCourtViewController
             destination.diningCourt = "Earhart"
            APIClient.sharedInstance.getMenu(diningCourt: "Earhart",date: dateString,success: {(items: JSON) in
                self.food = items
                //print(items)
                destination.data = self.food!
                
                
            }, error: { (error: Error) in
                print(error.localizedDescription)
                
            })

        }else if segue.identifier == "windsorSegue"{
            let destination = segue.destination as! DiningCourtViewController
            destination.diningCourt = "Windsor"
            
            APIClient.sharedInstance.getMenu(diningCourt: "Windsor",date: dateString,success: {(items: JSON) in
                self.food = items
                //print(items)
                destination.data = self.food!
                
                
            }, error: { (error: Error) in
                print(error.localizedDescription)
                
            })

        }else if segue.identifier == "hillenbrandSegue" {
            let destination = segue.destination as! DiningCourtViewController
            destination.diningCourt = "Hillenbrand"
            
            APIClient.sharedInstance.getMenu(diningCourt: "Hillenbrand",date: dateString,success: {(items: JSON) in
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
