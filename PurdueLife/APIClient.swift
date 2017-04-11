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
    
    func getMenu(diningCourt: String,date: String,success: @escaping (JSON) -> (),error: @escaping (Error) -> ()){
        Alamofire.request(baseUrl + "locations/" + diningCourt + "/" + date, method: .get, encoding: URLEncoding.default , headers: ["Accept" : "application/json"]).validate().responseJSON{response in
            if response.result.isSuccess {
                guard let info = response.result.value else {
                    print("Error")
                    
                    return
                }
                let json = JSON(info)
                
                //print(json)
                success(json)
                
            }else{
                error(response.result.error!)
                print("Error")
            }
            
            }
    }
    
    func getItemInfo(id: String, success: @escaping (JSON) -> (),error: @escaping (Error) -> ()){
        Alamofire.request(baseUrl + "items/" + id, method: .get, encoding: URLEncoding.default, headers: ["Accept" : "application/json"]).validate().responseJSON{response in
            if response.result.isSuccess{
                guard let info = response.result.value else {
                    print("Error")
                    return
                }
                
                let json = JSON(info)
                //print(json)
                success(json)
            }else{
                print("Error")
            }
        }
    }
    
    func getAhead(name: String,success: @escaping (JSON) -> (),error: @escaping (Error) -> ()){
        let url = baseUrl + "items/searchUpcoming/" + name
        let formattedUrl = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)
        //print(formattedUrl)
        Alamofire.request(formattedUrl!, method: .get, encoding: URLEncoding.default, headers: ["Accept" : "application/json"]).validate().responseJSON{response in
            //print(response)
            if response.result.isSuccess{
                guard let info = response.result.value else {
                    print("Error")
                    return
                }
                let json = JSON(info)
                //print(json)
                success(json)
            }else{
                print("Error here")
            }
        }

    }

    

}
