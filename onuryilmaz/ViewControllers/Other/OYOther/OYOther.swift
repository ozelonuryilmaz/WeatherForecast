//
//  OYOther.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/16/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYOther: OYBaseViewController {
    
    let blankPageWarning = OYBlankPageWarning()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        
    }
    
    func setupViewComponents(){
        
        //MARK: *** Navigation Bar
        setupNavigationBar(titleName: "Other")
        
        blankPageWarning.setup(self.view, text: "Blank Page", imageName: "iconSearch")
        
    }
    
}
