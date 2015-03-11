//
//  RESTService.swift
//
//  Created by Jason Blood on 3/11/15.
//

import Foundation

let _sharedService: RESTService = { RESTService() }()

class RESTService {
    class func sharedInstance() -> RESTService {
        return _sharedService
    }
    func performGET(urlString: String, authentication: String, completionHandler: ((jsonObject: AnyObject?, error: NSError?) -> Void)?) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.HTTPAdditionalHeaders = ["Accept": "application/json", "Content-Type": "application/json", "Authorization": authentication]
        sessionConfig.timeoutIntervalForRequest = 30.0
        
        let session = NSURLSession(configuration: sessionConfig)
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPMethod = "GET"
        
        session.dataTaskWithRequest(request) { data, response, error in
            if let handler = completionHandler {
                if (error == nil) {
                    var parseError: NSError?
                    let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: &parseError) as AnyObject?
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        handler(jsonObject: jsonResult, error: parseError)
                    }
                }
                else {
                    dispatch_async(dispatch_get_main_queue()) {
                        handler(jsonObject: nil, error: error)
                    }
                }
            }
        }.resume()
    }
    func performDELETE(urlString: String, authentication: String, completionHandler: ((jsonObject: AnyObject?, error: NSError?) -> Void)?) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.HTTPAdditionalHeaders = ["Accept": "application/json", "Content-Type": "application/json", "Authorization": authentication]
        sessionConfig.timeoutIntervalForRequest = 30.0
        
        let session = NSURLSession(configuration: sessionConfig)
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPMethod = "DELETE"
        
        session.dataTaskWithRequest(request) { data, response, error in
            if let handler = completionHandler {
                if (error == nil) {
                    var parseError: NSError?
                    let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: &parseError) as AnyObject?
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        handler(jsonObject: jsonResult, error: parseError)
                    }
                }
                else {
                    dispatch_async(dispatch_get_main_queue()) {
                        handler(jsonObject: nil, error: error)
                    }
                }
            }
        }.resume()
    }
    func performPOST(urlString: String, authentication: String, parameters: NSDictionary, completionHandler: ((jsonObject: AnyObject?, error: NSError?) -> Void)?) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.HTTPAdditionalHeaders = ["Accept": "application/json", "Content-Type": "application/json", "Authorization": authentication]
        sessionConfig.timeoutIntervalForRequest = 30.0
        
        let session = NSURLSession(configuration: sessionConfig)
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(parameters, options: nil, error: nil)
        request.HTTPMethod = "POST"
        
        session.dataTaskWithRequest(request) { data, response, error in
            if let handler = completionHandler {
                if (error == nil) {
                    var parseError: NSError?
                    let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: &parseError) as AnyObject?
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        handler(jsonObject: jsonResult, error: parseError)
                    }
                }
                else {
                    dispatch_async(dispatch_get_main_queue()) {
                        handler(jsonObject: nil, error: error)
                    }
                }
            }
        }.resume()
    }
    func performPUT(urlString: String, authentication: String, parameters: NSDictionary, completionHandler: ((jsonObject: AnyObject?, error: NSError?) -> Void)?) {
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        sessionConfig.HTTPAdditionalHeaders = ["Accept": "application/json", "Content-Type": "application/json", "Authorization": authentication]
        sessionConfig.timeoutIntervalForRequest = 30.0
        
        let session = NSURLSession(configuration: sessionConfig)
        
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(parameters, options: nil, error: nil)
        request.HTTPMethod = "PUT"
        
        session.dataTaskWithRequest(request) { data, response, error in
            if let handler = completionHandler {
                if (error == nil) {
                    var parseError: NSError?
                    let jsonResult: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: &parseError) as AnyObject?
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        handler(jsonObject: jsonResult, error: parseError)
                    }
                }
                else {
                    dispatch_async(dispatch_get_main_queue()) {
                        handler(jsonObject: nil, error: error)
                    }
                }
            }
        }.resume()
    }
}