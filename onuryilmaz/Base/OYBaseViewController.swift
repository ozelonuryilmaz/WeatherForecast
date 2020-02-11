//
//  OYBaseViewController.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/8/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYBaseViewController: UIViewController {
    
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    // MARK: *** Setup Navigation Controller
    func setupNavigationBar(titleName: String) {
        
        //Setup NavigationController
        if self.navigationController != nil {
            
            self.navigationController!.navigationBar.barTintColor = UIColor.primaryColor
            self.navigationController!.navigationBar.tintColor = UIColor.textColorOnPrimary
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            
            let titleLabel = UILabel()
            titleLabel.text = titleName.localized()
            titleLabel.font = UIFont.customFont(size: 16, customStyle: .Bold)
            titleLabel.textColor = UIColor.textColorOnPrimary
            titleLabel.sizeToFit()
            self.navigationItem.titleView = titleLabel
            self.navigationItem.leftBarButtonItem = nil
            
        }
    }
    
    // MARK: *** Activity Indicator View
    func showProgressView() {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        containerView.frame = window.frame
        containerView.center = window.center
        containerView.isUserInteractionEnabled = true
        containerView.backgroundColor = UIColor.customColorBlack.withAlphaComponent(0.2)
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = window.center
        progressView.backgroundColor = UIColor.customColorBlack.withAlphaComponent(0.8)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40);
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: progressView.frame.size.width / 2,
                                           y: progressView.frame.size.height / 2);
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        
        UIApplication.shared.keyWindow?.addSubview(containerView) //viewDidAppear
        
        activityIndicator.startAnimating()
    }
    
    func hideProgressView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.progressView.removeFromSuperview()
            self.containerView.removeFromSuperview()
        }
    }
    

}
