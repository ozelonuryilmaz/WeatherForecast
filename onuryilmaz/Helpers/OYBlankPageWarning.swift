//
//  OYBlankPageWarning.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/22/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYBlankPageWarning: NSObject {
    
    class var shared: OYBlankPageWarning {
        struct Static {
            static let instance: OYBlankPageWarning = OYBlankPageWarning()
        }
        return Static.instance
    }
    
    let image = UIImageView()
    let label = UILabel()
    
    func setup(_ view: UIView, text: String, imageName: String){
        
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
        
        //MARK: - ImageView Constant
        let widthAndHeightConstant = view.frame.size.width / 3
        let centerXConstant: CGFloat = -40
        
        //MARK: - Label Constant
        let topConstant: CGFloat = 40
        let leadingConstant: CGFloat = 16
        let trailingConstant: CGFloat = -16
        
        //MARK: - Constraints
        image.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let imageConstraints = [
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerXConstant),
            image.widthAnchor.constraint(equalToConstant: widthAndHeightConstant),
            image.heightAnchor.constraint(equalToConstant: widthAndHeightConstant)
        ]
        
        let labelConstraints = [
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingConstant),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailingConstant),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: topConstant)
        ]
        
        NSLayoutConstraint.activate(imageConstraints)
        NSLayoutConstraint.activate(labelConstraints)
        
    }
    
    func remove(){
        self.image.removeFromSuperview()
        self.label.removeFromSuperview()
    }

}
