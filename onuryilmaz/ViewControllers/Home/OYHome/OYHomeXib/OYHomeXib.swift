//
//  OYHomeXib.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/9/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYHomeXib: UITableViewCell {
    
    @IBOutlet weak var lblCity: UILabel!{
        didSet{
            lblCity.font = UIFont.customFont(size: 16, customStyle: .Semibold)
            lblCity.textColor = UIColor.customColorBlack
        }
    }
    @IBOutlet weak var lblWeather: UILabel!{
        didSet{
            lblWeather.font = UIFont.customFont(size: 16, customStyle: .Medium)
            lblWeather.textColor = UIColor.customColorBlack
        }
    }
    @IBOutlet weak var lblDesc: UILabel!{
        didSet{
            lblDesc.font = UIFont.customFont(size: 16, customStyle: .Bold)
            lblDesc.textColor = UIColor.customColorBlack
        }
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }
    
    func setWeather(weatherArray: OYModels.WeatherArray){
        self.lblWeather.text = weatherArray.date
        self.lblCity.text = weatherArray.city
        self.lblDesc.text = weatherArray.description
        
    }
    
}
