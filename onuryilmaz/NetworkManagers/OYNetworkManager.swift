//
//  OYNetworkManager.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/8/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import SwiftyJSON

class OYNetworkManager: NSObject {
    
    // MARK: *** Helpers
    
    class func getHeader() -> [String : String] {
        
        let token = ""
        let header : [String:String] = ["Authorization": token , "Content-Type": "application/json"]
        return header
    }
    
    class func getHeaderWithoutToken() -> [String : String] {
        
        let header : [String:String] = ["Content-Type": "application/json"]
        return header
    }
    
    
    class func printAndShowError(url: String, error: Error, statusCode: Int) {
        print("***ERROR***\nurl = \(url)\nstatusCode = \(statusCode)\nlocalized = \(error.localizedDescription)\nerror = \(error)\n")
    }
    
    
    
    // MARK: Endpoints
    
    class func forecast(city: String, key: String, success:@escaping (_ response: OYModels.MainModel) -> Void, failure:@escaping (_ error:Error , _ statusCode:Int) -> Void) -> Void {
        
        let parametre = ["q": city,
                         "appid": key]
        
        var forecastURL = URLComponents(string: OYConstants.Url.FORECAST)
        var items = [URLQueryItem]()
        
        for (key,value) in parametre {
            items.append(URLQueryItem(name: key, value: value))
        }
        
        forecastURL?.queryItems = items
        let request =  URLRequest(url: (forecastURL?.url)!)

        OYBaseNetworkManager.post(url: request.url!.absoluteString, parameters: nil, headers: nil, success: { (data) in

            var theResponse : OYModels.MainModel

            do {
                let decoder = JSONDecoder()
                theResponse = try decoder.decode(OYModels.MainModel.self, from: data!)
                success(theResponse)

            } catch let error {
                print(error)
                failure(error, -1)
                printAndShowError(url: OYConstants.Url.FORECAST, error: error, statusCode: -1)
            }

        }) { (Error, statusCode) in
            failure(Error, statusCode)
            printAndShowError(url: OYConstants.Url.FORECAST, error: Error, statusCode: statusCode)
        }
    }

}





