//
//  OYSplash.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/9/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYSplash: OYBaseViewController {
    
    // MARK: *** Permission

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let theTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "theTabBarController") as! UITabBarController
        theTabBarController.modalPresentationStyle = .fullScreen
        theTabBarController.modalTransitionStyle = .crossDissolve
        self.present(theTabBarController, animated: true, completion: nil)
        
        OYHelper.setupTabBarControler(tabBarController: theTabBarController)
        
    }
    

}
