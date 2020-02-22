//
//  OYCustomMessages.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/9/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYCustomMessages: NSObject {
    
//    static let shared = OYCustomMessages()
    
    class var shared: OYCustomMessages {
        struct Static {
            static let instance: OYCustomMessages = OYCustomMessages()
        }
        return Static.instance
    }
    
    var overlayView = UIView()
    var backView = UIView()
    var lbl = UILabel()
    
    var actionSheet: UIAlertController!
    
    //OYCustomMessages.shared.alertController(self, title: "Title", message: "Message")
    func alertController(_ viewController: UIViewController, title: String, message: String){
        
        self.actionSheet = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        self.actionSheet.addAction(UIAlertAction(title: NSLocalizedString("Done", comment: ""), style: .default, handler: {
            action in
            self.actionSheet.dismiss(animated: true, completion: nil)
        }))
        
        viewController.present(self.actionSheet, animated: true) {
            self.actionSheet.view.superview?.subviews.first?.isUserInteractionEnabled = true
            self.actionSheet.view.superview?.subviews.first?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.actionSheetBackgroundTapped)))
        }
    }
    
    @objc func actionSheetBackgroundTapped(){
        self.actionSheet.dismiss(animated: true, completion: nil)
    }
    
    func setup(_ view: UIView, txt_msg: String){
        
        let white = UIColor ( red: 1/255, green: 0/255, blue:0/255, alpha: 0.0 )
        
        backView.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height)
        backView.center = view.center
        backView.backgroundColor = white
        view.addSubview(backView)
        
        let lblFont: UIFont = UIFont.customFont(size: 18, customStyle: .Medium)
        let width = view.frame.width - 60
        
        let lblHeight = txt_msg.height(withConstrainedWidth: width, font: lblFont)
        
        overlayView.frame = CGRect(x: 0, y: 0, width: width, height: lblHeight)
        overlayView.center = CGPoint(x: view.bounds.width / 2, y: view.bounds.height / 2 + lblHeight)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.alpha = 0
        
        lbl.frame = CGRect(x: 0, y: 0, width: width, height: lblHeight)
        lbl.text = NSLocalizedString(txt_msg, comment: "OYCustomMessages")
        lbl.textColor = UIColor.white
        lbl.font = lblFont
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.center = overlayView.center
        lbl.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        
        overlayView.addSubview(lbl)
        
        view.addSubview(overlayView)
    }
    
    func short(_ view: UIView, txt_msg: String) {
        
        self.setup(view,txt_msg: txt_msg)
        
        //Animation
        UIView.animate(withDuration: 1, animations: {
            self.overlayView.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 1, animations: {
                self.overlayView.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 1, animations: {
                    DispatchQueue.main.async(execute: {
                        self.overlayView.alpha = 0
                        self.lbl.removeFromSuperview()
                        self.overlayView.removeFromSuperview()
                        self.backView.removeFromSuperview()
                    })
                })
            }
        }
        
    }
    
    func long(_ view: UIView, txt_msg: String) {
        
        self.setup(view,txt_msg: txt_msg)
        
        //Animation
        UIView.animate(withDuration: 2, animations: {
            self.overlayView.alpha = 1
        }) { (true) in
            UIView.animate(withDuration: 2, animations: {
                self.overlayView.alpha = 0
            }) { (true) in
                UIView.animate(withDuration: 2, animations: {
                    DispatchQueue.main.async(execute: {
                        self.overlayView.alpha = 0
                        self.lbl.removeFromSuperview()
                        self.overlayView.removeFromSuperview()
                        self.backView.removeFromSuperview()
                    })
                })
            }
        }
        
    }
    
}
