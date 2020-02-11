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
        
        tabBarController.tabBar.tintColor = UIColor.primaryColor
        tabBarController.tabBar.barTintColor = UIColor.secondaryColor
        tabBarController.tabBar.unselectedItemTintColor = UIColor.customColorBlack
        
        for i in 0 ..< OYConfigs.applicationTabBarCount  {
            let tabBarItem = UITabBarItem.init(title: "tabBarItemName\(i)".localized(), image: UIImage.init(named: "tabBarIcon\(i)"), tag: i)
            tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.customFont(size: 13, customStyle: .Regular)!], for: .normal)
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

// MARK: *** Shake Label
extension UILabel {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}

// MARK: *** Calculate Label Height or Width String Extension
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
