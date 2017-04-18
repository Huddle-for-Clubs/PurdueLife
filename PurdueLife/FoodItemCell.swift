//
//  FoodItemCell.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/3/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Firebase
import SwipeCellKit
import SwiftDate

class FoodItemCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        likeButton.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onLike(_ sender: Any) {
        likeButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
        let defaults  = UserDefaults.standard
        
        var favorites = defaults.stringArray(forKey: "favorites")
        
        if favorites == nil{
            let temp:[String] = [nameLabel.text!]
            defaults.set(temp , forKey: "favorites")
        }else{
            favorites?.append(nameLabel.text!)
            defaults.set(favorites! , forKey: "favorites")
            for item in favorites!{
                //print(item)
            }
        }
        
        var dataRef = FIRDatabase.database().reference()
        
        let user = FIRAuth.auth()?.currentUser
        
        let ref = dataRef.child("users").child((user?.uid)!)
        
        
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if(snapshot.hasChild("favorites")){
                print("Exists")
                let value = snapshot.value as? NSDictionary
                
                var favorites = value?["favorites"] as? [String]
                favorites?.append(self.nameLabel.text!)
                
//                var tempArray = (ref.child("favorites").value as? [String])
//                tempArray.append(self.nameLabel.text!)
               ref.child("favorites").setValue(favorites)
                let array = ["ksdjg"]
                let date = DateInRegion()
                let dateString = date.string(format: .custom("MM-dd-yyyy"))
                dataRef.child("likes").child(dateString).setValue(array)
                
            }else{
                
                print("doesnt")
                ref.child("favorites").setValue([self.nameLabel.text!])
            }
        })
        
        
//        var postInfo: [String: String] = [:]
//        postInfo["name"] = nameLabel.text!
//        
//        
//        
//        ref.setValue(postInfo)
//        

        

    }
    
    
}
