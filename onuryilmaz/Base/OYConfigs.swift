//
//  OYConfigs.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/8/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYConfigs: NSObject {
    
    static let applicationDomain = "http://api.openweathermap.org"
    static let developmentDomain = "http://apitest.openweathermap.org"
    
    static let applicationFontName = "EncodeSansCondensed" //Font files under the Resources
    
    static let applicationTabBarCount = 2 //You can customize tabbar names from Localizable.strings under the Resources
    
    static let applicationSupportedLanguageCodes = ["tr","en"] //You must add localize.strings files under the Resources
    
    static let applicationSupportedLanguageCodesWithNames = ["tr":"Türkçe","en":"English"] //For language selection screen RMSLanguageSelection

}


// MARK: *** Application Colors
extension UIColor {
    
    //Main Colors
    class var primaryColor: UIColor {
        return UIColor.init(hexString: "#EE6822")
    }
    
    class var primaryLightColor: UIColor {
        return UIColor.init(hexString: "#EE9A4E")
    }
    
    class var primaryDarkColor: UIColor {
        return UIColor.init(hexString: "#CC6626")
    }
    
    class var secondaryColor: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    // Text Colors
    class var textColorOnPrimary: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    class var textColorOnPrimaryDark: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    class var textColorOnPrimaryLight: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    class var textColorOnSecondary: UIColor {
        return UIColor.init(hexString: "#421109")
    }
    
    //Custom Colors
    class var customColorGreen: UIColor {
        return UIColor.init(hexString: "#27B085")
    }
    
    class var customColorBlue: UIColor {
        return UIColor.init(hexString: "#007AFF")
    }
    
    class var customColorRed: UIColor {
        return UIColor.init(hexString: "#D9390D")
    }
    
    class var customColorOrange: UIColor {
        return UIColor.init(hexString: "#FF7900")
    }
    
    class var customColorYellow: UIColor {
        return UIColor.init(hexString: "#FFE304")
    }
    
    class var customColorBlack: UIColor {
        return UIColor.init(hexString: "#212231")
    }
    
    class var customColorGrey: UIColor {
        return UIColor.init(hexString: "#9F9FAE")
    }
    
    class var customColorLightGrey: UIColor {
        return UIColor.init(hexString: "#D0D0D0")
    }
    
    class var customColorDarkGrey: UIColor {
        return UIColor.init(hexString: "#718181")
    }
    
    class var customColorWhiteDarker: UIColor {
        return UIColor.init(hexString: "#F8F9F9")
    }
    
    class var customColorFacebook: UIColor {
        return UIColor.init(hexString: "#3B5AA8")
    }
    
    class var customColorGoogle: UIColor {
        return UIColor.init(hexString: "#DB4547")
    }
    
    class var customColorOrangeBack: UIColor {
        return UIColor.init(hexString: "#fff1e6")
    }
    
    class var customColorBlueOrder: UIColor {
        return UIColor.init(hexString: "#f7ffff")
    }
    
    class var customColorBlueBack: UIColor {
        return UIColor.init(hexString: "#a5caaa")
    }
    
    class var customColorGreenOrder: UIColor {
        return UIColor.init(hexString: "#f6ffee")
    }
    
    class var customColorGreenBack: UIColor {
        return UIColor.init(hexString: "#16c257")
    }
    
    // Convert HexColor to UIColor
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
}


// MARK: *** Customize Application Font

extension UIFont {
    
    // Secondary Font
    enum FontStyle : String {
        
        case Black = "Black"
        case Bold = "Bold"
        case ExtraBold = "ExtraBold"
        case ExtraLight = "ExtraLight"
        case Light = "Light"
        case Medium = "Medium"
        case Regular = "Regular"
        case Semibold = "SemiBold"
        case Thin = "Thin"
        
    }
    
    class func customFont(size : Int , customStyle : FontStyle) -> UIFont! {
        return UIFont(name: "\(OYConfigs.applicationFontName)-\(customStyle.rawValue)", size: CGFloat(size))
    }
    
}
