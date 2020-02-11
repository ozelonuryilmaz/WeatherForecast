//
//  OYHomeXib.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/9/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYHomeXib: UITableViewCell {
    
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblDesc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setWeather(weatherArray: OYModels.WeatherArray){
        self.lblWeather.text = weatherArray.date
        self.lblCity.text = weatherArray.city
        self.lblDesc.text = weatherArray.description
        
    }
    
}
