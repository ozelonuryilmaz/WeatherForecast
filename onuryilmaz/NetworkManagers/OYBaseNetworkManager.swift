//
//  OYBaseNetworkManager.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/8/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class OYBaseNetworkManager: NSObject {
    
    //MARK: *** Check Internet Connection
    
    class func checkInternetConnection(uiView: UIView) {
        
        if let reachabilityManager = NetworkReachabilityManager() {
            
            reachabilityManager.startListening()
            reachabilityManager.listener = { _ in
                
                if !reachabilityManager.isReachable {
                    print("Internet Available")
                    
                    OYCustomMessages.shared.long(uiView, txt_msg: "Please check your internet connection.".localized())
                    
                }
            }
        }
    }
    
    class func post(url: String, parameters: [String : Any]?, headers:[String : String]?, success:@escaping (_ response:Data?) -> Void, failure:@escaping (_ error:Error , _ statusCode:Int) -> Void ) -> Void {
        
        Alamofire.request(url, method:.post, parameters:parameters, encoding:JSONEncoding.default, headers:headers).validate(statusCode: 200..<300).responseJSON(completionHandler: { response in
            
            print("url: ", url)
            print("parameters: \(JSON(parameters as Any))")
            
            switch response.result {
                
            case .success( _):
                success(response.data)
                
            case .failure(let error):
                let statusCode : Int = response.response?.statusCode ?? 0
                failure(error, statusCode)
            }
            
        })
    }
    
    
//    class func get(url: String, parameters: [String : Any]?, headers:[String : String]?, success:@escaping (_ response:Data?) -> Void, failure:@escaping (_ error:Error , _ statusCode:Int) -> Void ) -> Void {
//
//        Alamofire.request(url, method:.get, parameters:parameters, encoding:JSONEncoding.default, headers:headers).validate().responseJSON{ response in
//
//            print("url: ", url)
//            print("parameters: \(JSON(parameters as Any))")
//
//            switch response.result {
//                
//            case .success( _):
//                success(response.data)
//
//            case .failure(let error):
//                let statusCode : Int = response.response?.statusCode ?? 0
//                failure(error, statusCode)
//            }
//        }
//    }
//
//
//    class func delete(url: String, parameters: [String : Any]?, headers:[String : String]?, success:@escaping (_ response:Data?) -> Void, failure:@escaping (_ error:Error , _ statusCode:Int) -> Void ) -> Void {
//
//
//        Alamofire.request(url, method:.delete, parameters:parameters, encoding:JSONEncoding.default, headers:headers).validate().responseJSON{ response in
//
//            switch response.result {
//
//            case .success( _):
//                success(response.data)
//
//            case .failure(let error):
//                let statusCode : Int = response.response?.statusCode ?? 0
//                failure(error, statusCode)
//            }
//        }
//    }
//
//    class func put(url: String, parameters: [String : Any]?, headers:[String : String]?, success:@escaping (_ response:Data?) -> Void, failure:@escaping (_ error:Error , _ statusCode:Int) -> Void ) -> Void {
//
//        Alamofire.request(url, method:.put, parameters:parameters, encoding:JSONEncoding.default, headers:headers).validate().responseJSON{ response in
//
//            switch response.result {
//
//            case .success( _):
//                success(response.data)
//
//            case .failure(let error):
//                let statusCode : Int = response.response?.statusCode ?? 0
//                failure(error, statusCode)
//            }
//        }
//    }
//
//
//    class func uploadData(url: String, parameters: [String : AnyObject]?, headers:[String : String]?,datas: [Data], dataName: String,fileName: String, mimeType: String, fileExtension: String,success:@escaping (_ response:Data?) -> Void, failure:@escaping (_ error:Error) -> Void ) -> Void {
//
//        Alamofire.upload( multipartFormData: { multipartFormData in
//
//            for i in 0 ..< datas.count {
//                let data = datas[i]
//
//                multipartFormData.append(data, withName: "\(dataName)\(i)", fileName: "\(fileName)\(i).\(fileExtension)" , mimeType: "\(mimeType)/\(fileExtension)")
//            }
//
//            if (parameters != nil) {
//                for (key, value) in parameters! {
//                    if value is String {
//                        multipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                    } else if value is Int {
//                        multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
//                    }
//                }
//            }
//
//        },  to: url, method: .post , headers: headers , encodingCompletion: { encodingResult in
//
//            switch encodingResult {
//
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    success(response.data)
//                }
//
//            case .failure(let encodingError):
//                failure(encodingError)
//            }
//        })
//    }
//
//    class func downloadData(url: String!, fileName: String!, folderName: String!,progress: @escaping (_ progress: Progress) ->Void ,success:@escaping (_ response:Data?, _ fileLocalURL: URL) -> Void, failure:@escaping (_ error:Error) -> Void ) -> Void {
//
//        var fileURL = URL.init(string:"a")!
//
//        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
//            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            let fileFolderURL = documentsURL.appendingPathComponent(folderName)
//            fileURL = fileFolderURL.appendingPathComponent(fileName)
//            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
//        }
//
//        Alamofire.download(url, to: destination).downloadProgress { (Progress) in
//            progress(Progress)
//
//            }.responseData { response in
//
//                switch response.result {
//
//                case .success( _):
//
//                    success(response.resumeData,fileURL)
//
//                case .failure(let error):
//                    failure(error)
//                }
//        }
//    }
    
}
