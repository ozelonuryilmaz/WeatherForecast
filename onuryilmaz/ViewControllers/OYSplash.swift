//
//  OYSplash.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/9/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYSplash: UIViewController {
    
    // MARK: *** Permission

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let theTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "theTabBarController") as! UITabBarController
        theTabBarController.modalTransitionStyle = .crossDissolve
        theTabBarController.modalPresentationStyle = .fullScreen
        self.present(theTabBarController, animated: true, completion: nil)
        
        OYHelper.setupTabBarControler(tabBarController: theTabBarController)
        
    }
    

}
