//
//  OYHomeDetail.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/16/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYHomeDetail: OYBaseViewController {
    
    @IBOutlet weak var lblWeatherForecast: UILabel!
    
    var weatherForecast : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewComponents()
        
    }
    
    func setupViewComponents(){
        
        //MARK: *** Navigation Bar
        setupNavigationBar(titleName: "Weather Forecast")
        
        //MARK: *** Label
        lblWeatherForecast.text = weatherForecast
        lblWeatherForecast.font = UIFont.customFont(size: 20, customStyle: .Semibold)
        lblWeatherForecast.textColor = UIColor.customColorBlack
        
    }
    
}
