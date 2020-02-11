//
//  OYConstants.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/8/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYConstants: NSObject {
    
    // MARK: *** Endpoints Constants
    private struct Domains{
        
        static let development = OYConfigs.developmentDomain
        static let production = OYConfigs.applicationDomain
        
        static let active = production
        
    }
    
    struct Routes {
        static let API = "/data/"
    }
    
    struct Url {
        static let FORECAST =  Domains.active + Routes.API + "2.5/forecast?"
    }
    
    static let WEATHER_KEY = "f9fed13dff94cb5bac5035610420addc"
    
    struct UserDefaults {
        
        static let APP_SELECTED_LANG = "applicationSelectedLanguage"
        
    }
    
    

}
