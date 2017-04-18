//
//  FoodDetail.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/4/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON

class FoodDetail: NSObject {
    var nutrition: [JSON] = []
    var nutritionArrray : [String] = []
    var allergenArray: [String] = []
    var name: String = ""
    var allergens: String = ""
    var isVeg: String = "Vegetarian: "
    var ingrediants: String = ""
    
    init(json : JSON){
        self.name = json["Name"].stringValue
        self.nutrition = json["Nutrition"].arrayValue
        
        for value in self.nutrition{
            nutritionArrray.append("\(value["Name"].stringValue): \(value["LabelValue"].stringValue)")
            
            if(value["Name"].stringValue == "Protein"){
                break
            }
        }
        //print(self.nutrition)
        
        let tempArray: [JSON] = json["Allergens"].arrayValue
        for allergen in tempArray{
            self.allergens += allergen["Name"].stringValue + ", "
            self.allergenArray.append(allergen["Name"].stringValue)
        }
        
        let tempBool: Bool = json["IsVegetarian"].boolValue
        if tempBool == true {
            self.isVeg += "Yes"
        }else{
            self.isVeg += "No"
        }
        
        self.ingrediants = json["Ingredients"].stringValue
        
        //print(name)
        
    }

}
