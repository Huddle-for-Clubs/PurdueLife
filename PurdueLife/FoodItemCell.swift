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

    }
}
