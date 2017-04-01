//
//  FoodItem.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 3/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class FoodItem: NSObject {
    
    var name:String = ""

    init(json: JSON){
        name = json["Name"].stringValue
        print(name)
        
    }

}
