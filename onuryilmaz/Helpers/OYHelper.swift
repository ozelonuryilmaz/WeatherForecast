//
//  OYHelper.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/9/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYHelper: NSObject {
    
    // MARK: *** Setup TabBar Controller
    class func setupTabBarControler(tabBarController: UITabBarController) {
        
        tabBarController.tabBar.unselectedItemTintColor = UIColor.customColorBlack.withAlphaComponent(0.6)
        tabBarController.tabBar.tintColor = UIColor.primaryColor
        tabBarController.tabBar.barTintColor = UIColor.secondaryColor
        
        for i in 0 ..< OYConfigs.applicationTabBarCount  {
            let tabBarItem = UITabBarItem.init(title: NSLocalizedString("tabBarItemName\(i)", comment: "setupTabBarControler"), image: UIImage.init(named: "tabBarIcon\(i)"), tag: i)
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.customFont(size: 14, customStyle: .Medium)!], for: .normal)
            tabBarController.viewControllers![i].tabBarItem = tabBarItem
        }
    }
    
    class func convertTimestamp(timestamp: Int) -> String {
        var strDate = "undefined"
            
        let date = Date(timeIntervalSince1970: Double(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        strDate = dateFormatter.string(from: date)
            
        return strDate
    }
    
}

// MARK: *** Close Keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: *** Shake label
extension UILabel {
    func shake() {
        let anim = CABasicAnimation(keyPath: "state")
        anim.autoreverses = true
        anim.duration = 0.06
        anim.repeatCount = 6
        anim.fromValue = CGPoint(x: self.center.x - 4.5, y: self.center.y)
        anim.toValue = CGPoint(x: self.center.x + 4.5, y: self.center.y)
        layer.add(anim, forKey: "state")
    }
}

// MARK: *** Calculate label height or width string extension
extension String {
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRectangle = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRectangle, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRectangle = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRectangle, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
}
