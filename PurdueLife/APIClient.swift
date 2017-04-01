//
//  APIClient.swift
//  PurdueLife
//
//  Created by Youssef Elabd on 3/28/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class APIClient: NSObject {
    
    static let sharedInstance = APIClient()
    
    let baseUrl = "http://api.hfs.purdue.edu/menus/v2/"
    
    func getMenu(diningCourt: String,date: String,success: @escaping ([FoodItem]) -> (),error: @escaping (Error) -> ()){
        Alamofire.request("location/" + baseUrl + diningCourt + "/" + date, method: .get, encoding: URLEncoding.default , headers: ["Accept" : "application/json"]).validate().responseJSON{response in
            if response.result.isSuccess {
                guard let info = response.result.value else {
                    print("Error")
                    
                    return
                }
                let json = JSON(info)
                print(json)
                
            }else{
                error(response.result.error!)
                print("Error")
            }
            
            }
    }
    
    func getItemInfo(id: String, success: @escaping () -> (),error: @escaping (Error) -> ()){
        Alamofire.request(baseUrl + "items/" + id, method: .get, encoding: URLEncoding.default, headers: ["Accept" : "application/json"]).validate().responseJSON{response in
            if response.result.isSuccess{
                guard let info = response.result.value else {
                    print("Error")
                    return
                }
                let json = JSON(info)
                print(json)
            }else{
                print("Error")
            }
        }
    }
    
    func getAhead(name: String,success: @escaping () -> (),error: @escaping (Error) -> ()){
        Alamofire.request(baseUrl + "items/searchUpcoming/" + name, method: .get, encoding: URLEncoding.default, headers: ["Accept" : "application/json"]).validate().responseJSON{response in
            if response.result.isSuccess{
                guard let info = response.result.value else {
                    print("Error")
                    return
                }
                let json = JSON(info)
                print(json)
            }else{
                print("Error")
            }
        }

    }

    

}
