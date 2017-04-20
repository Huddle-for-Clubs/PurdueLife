//
//  FavoriteDetailCell.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/18/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit

class FavoriteDetailCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var stationLabel: UILabel!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
