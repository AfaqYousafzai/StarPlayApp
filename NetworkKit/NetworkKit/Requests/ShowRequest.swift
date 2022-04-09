//
//  ShowRequest.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import UIKit
import Alamofire

public enum makeURL {
    case showTV
    case showSeason(seasonNumber: Int)
    
    public func getURl() -> String {
        var url: String = ""
        
        switch self {
        case .showTV:
            return "/76479"
        case .showSeason(let seasonnumber):
            return String(format: "/%@/season/%@", "76479", "\(seasonnumber)")
        }
        
    }
}

public class ShowRequest: BaseRequest {
    
    public override var getParams: [String : String] {
        get {
            let dicParams : [String : String] = ["api_key": AppConstant.apiKey]
            return dicParams
        }
    }

    public override var requestType: HTTPMethod {
        get {
            return .get
        }
        set {
            
        }
    }
    
    
    
    
    public override init() {
        super.init()
    }
    
    
}
