//
//  FoodItemCell.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/3/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit

class FoodItemCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
                print(item)
            }
        }
        

    }
}
