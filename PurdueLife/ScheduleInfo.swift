//
//  ScheduleInfo.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 4/18/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftDate
import SwiftyJSON

class ScheduleInfo: NSObject {
    
    var date: String = ""
    var location: String = ""
    var station: String = ""
    var meal: String = ""
    var id: String = ""
    
    init(json : JSON){
        let tempDate = json["Date"].stringValue
        
        let date = DateInRegion(string: tempDate, format: .iso8601(options: .withInternetDateTime))
        self.date = (date?.string(dateStyle: .short, timeStyle: .short))!
        
        self.location = json["Location"].stringValue
        self.meal = json["Meal"].stringValue
        self.station = json["Station"].stringValue
        self.id = json["ID"].stringValue
        
        print(self.date)
        print(self.location)
    }
    

}
