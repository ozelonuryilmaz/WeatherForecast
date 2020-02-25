//
//  OYBlankPageWarning.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/22/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYBlankPageWarning: NSObject {
    
//    class var shared: OYBlankPageWarning {
//        struct Static {
//            static let instance: OYBlankPageWarning = OYBlankPageWarning()
//        }
//        return Static.instance
//    }
    
    let image = UIImageView()
    let label = UILabel()
    let button = UIButton(type: .system)
    
    private var buttonNotificationName = String()
    
    func setup(_ view: UIView, text: String, imageName: String, buttonName: String = "", notificationName: String = ""){
        
        //MARK: - UIImageView
        image.image = UIImage(named: imageName)
        image.contentMode = .scaleAspectFit
//        image.frame = CGRect(x: 0, y: 0, width: view.frame.size.width / 2.5, height: view.frame.size.width / 2.5)
        view.addSubview(image)
        
        //MARK: - UILabel
        label.font = UIFont.customFont(size: 20, customStyle: .Semibold)
        label.textColor = UIColor.customColorBlack
        label.text = NSLocalizedString(text, comment: "OYBlankPageWarning")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        view.addSubview(label)
        
        //MARK: - UIButton
        if buttonName != "" || notificationName != "" {
            button.setTitle(NSLocalizedString(buttonName, comment: "OYBlankPageWarning"), for: .normal)
            button.titleLabel?.font = UIFont.customFont(size: 16, customStyle: .Bold)
            button.setTitleColor(UIColor.textColorOnPrimary, for: .normal)
            button.backgroundColor = UIColor.primaryColor
            button.layer.cornerRadius = 5
            buttonNotificationName = notificationName
            button.addTarget(self, action: #selector(tapBtnNotification), for: .touchUpInside)
            view.addSubview(button)
        }
        
        //MARK: - ImageView Constant
        let widthAndHeightConstant = view.frame.size.width / 3
        let centerXConstant: CGFloat = -42
        
        //MARK: - Label and Button Constant
        let topConstant: CGFloat = 16
        let bottomConstant: CGFloat = -16
        let leadingConstant: CGFloat = 16
        let trailingConstant: CGFloat = -16
        let heightConstant: CGFloat = 42
        
        var layoutGuide: UILayoutGuide!
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        }else {
            layoutGuide = view.layoutMarginsGuide
        }
        
        //MARK: - Constraints
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let imageConstraints = [
            image.centerXAnchor.constraint(equalTo: layoutGuide.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: layoutGuide.centerYAnchor, constant: centerXConstant),
            image.widthAnchor.constraint(equalToConstant: widthAndHeightConstant),
            image.heightAnchor.constraint(equalToConstant: widthAndHeightConstant)
        ]
        
        let labelConstraints = [
            label.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: leadingConstant),
            label.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: trailingConstant),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: topConstant)
        ]
        
        NSLayoutConstraint.activate(imageConstraints)
        NSLayoutConstraint.activate(labelConstraints)
        
        if buttonName != "" || notificationName != "" {
            
            let buttonConstraints = [
                button.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: leadingConstant),
                button.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: trailingConstant),
                button.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: bottomConstant),
                button.heightAnchor.constraint(equalToConstant: heightConstant)
            ]
            
            NSLayoutConstraint.activate(buttonConstraints)
            
        }
    }
    
    func remove(){
        DispatchQueue.main.async {
            self.image.removeFromSuperview()
            self.label.removeFromSuperview()
            self.button.removeFromSuperview()
        }
    }
    
    @objc private func tapBtnNotification(sender: UIButton){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: buttonNotificationName), object: nil, userInfo: nil)
    }

}
