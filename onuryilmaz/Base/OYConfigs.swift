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
    
    static let applicationTabBarCount = 2 // You can customize tabbar names from Localizable. Strings under the Resources
    
    static let applicationSupportedLanguageCodesWithNames = ["tr":"Türkçe", "en":"English"] // For language selection screen RMSLanguageSelection
    
    static let applicationSupportedLanguageCodes = ["tr", "en"] // You must add localize. Strings files under the Resources
    
    static let applicationFontName = "EncodeSansCondensed" // Font files under the Resources
    
}


// MARK: *** App Colors

extension UIColor {
    
    //MARK: - Main Colors
    
    class var primaryColor: UIColor {
        return UIColor.init(hexString: "#1122822")
    }
    
    class var primaryLightColor: UIColor {
        return UIColor.init(hexString: "#229A4E")
    }
    
    class var primaryDarkColor: UIColor {
        return UIColor.init(hexString: "#336536")
    }
    
    class var secondaryColor: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    //MARK: - Text Colors
    
    class var textColorOnPrimary: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    class var textColorOnPrimaryLight: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    class var textColorOnPrimaryDark: UIColor {
        return UIColor.init(hexString: "#FFFFFF")
    }
    
    class var textColorOnSecondary: UIColor {
        return UIColor.init(hexString: "#421109")
    }
    
    //MARK: - Custom Colors
    
    class var customColorGrey: UIColor {
        return UIColor.init(hexString: "#9F9FAE")
    }
    
    class var customColorWhiteDarker: UIColor {
        return UIColor.init(hexString: "#F8F9F9")
    }
    
    class var customColorLightGrey: UIColor {
        return UIColor.init(hexString: "#D0D0D0")
    }
    
    class var customColorDarkGrey: UIColor {
        return UIColor.init(hexString: "#718181")
    }
    
    class var customColorBlack: UIColor {
        return UIColor.init(hexString: "#212231")
    }
    
    class var customColorBlue: UIColor {
        return UIColor.init(hexString: "#007AFF")
    }
    
    class var customColorRed: UIColor {
        return UIColor.init(hexString: "#D9390D")
    }
    
    class var customColorGreen: UIColor {
        return UIColor.init(hexString: "#27B085")
    }
    
    class var customColorOrange: UIColor {
        return UIColor.init(hexString: "#FF7900")
    }
    
    class var customColorYellow: UIColor {
        return UIColor.init(hexString: "#FFE304")
    }
    
    // Convert HexColor to UIColor
    convenience init(hexString: String) {
        
        let hexStr = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int32 = UInt32()
        Scanner(string: hexStr).scanHexInt32(&int32)
        let a, r, g, b: UInt32
        switch hexStr.count {
        case 3: // RGB * 12-bit
            (a, r, g, b) = (255, (int32 >> 8) * 17, (int32 >> 4 & 0xF) * 17, (int32 & 0xF) * 17)
        case 6: // RGB * 24-bit
            (a, r, g, b) = (255, int32 >> 16, int32 >> 8 & 0xFF, int32 & 0xFF)
        case 8: // ARGB * 32-bit
            (a, r, g, b) = (int32 >> 24, int32 >> 16 & 0xFF, int32 >> 8 & 0xFF, int32 & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        
    }
    
}


// MARK: *** Customize App Font

extension UIFont {
    
    // MARK: - Secondary Font
    enum FontStyle : String {
        case Thin = "Thin"
        case Black = "Black"
        case Light = "Light"
        case Medium = "Medium"
        case Regular = "Regular"
        case Bold = "Bold"
        case Semibold = "SemiBold"
        case ExtraBold = "ExtraBold"
        case ExtraLight = "ExtraLight"
    }
    
    class func customFont(size : Int , customStyle : FontStyle) -> UIFont! {
        return UIFont(name: "\(OYConfigs.applicationFontName)-\(customStyle.rawValue)", size: CGFloat(size))
    }
    
}
