//
//  BaseRequest.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import UIKit
import Alamofire

public class BaseRequest: NSObject {
        
    public var URL = ""
    public var requestType : HTTPMethod = HTTPMethod.get
    public var message = "Please, Wait."
    public var getParams : [String:String] {
        get {
            return [String:String]()
        }
    }
    
//    var authToken : HTTPHeaders {
//        return APIConstants.authHeaders()
//    }
    
    public override init() {
        super.init()
    }
    
}
