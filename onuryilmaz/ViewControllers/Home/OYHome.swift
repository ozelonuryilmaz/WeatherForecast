//
//  OYHome.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/9/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYHome: OYHomeBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewComponents()
        self.btnSearch.addTarget(self, action: #selector(tapBtnSearch(sender:)), for: .touchUpInside)
        
        self.tableViewWeather.delegate = self
        self.tableViewWeather.dataSource = self
        self.tableViewWeather.rowHeight = UITableView.automaticDimension
        self.tableViewWeather.estimatedRowHeight = 300
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        OYBaseNetworkManager.checkInternetConnection(uiView: self.view)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.getWeather(city: "istanbul", key: OYConstants.WEATHER_KEY, success: { (response) in
            
            response == true ? self.tableViewWeather.reloadData() : OYCustomMessages.shared.long(self.view, txt_msg: "An error has occured.".localized())
            
        }) { (error, statusCode) in
            OYCustomMessages.shared.long(self.view, txt_msg: "\(error)")
        }
        
    }
    
    // MARK: *** Button Tap Actions
    @IBAction func tapBtnSearch(sender: UIButton) {
        
    }
    
}



extension OYHome: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.weatherArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("OYHomeXib", owner: self, options: nil)?.first as! OYHomeXib
        cell.setWeather(weatherArray: self.weatherArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
        
    }
    
}



//func getWeather(){
//
//    let session = URLSession(configuration: .default)
//    var dataTask : URLSessionDataTask?
//    let url = "http://api.openweathermap.org/data/2.5/forecast?"
//    let myKey = "f9fed13dff94cb5bac5035610420addc"
//    let myCity = "istanbul"
//    var items = [URLQueryItem]()
//    var myURL = URLComponents(string: url)
//    let parametre = ["q":myCity,"appid": myKey]
//
//    for (key,value) in parametre {
//        items.append(URLQueryItem(name: key, value: value))
//    }
//
//    myURL?.queryItems = items
//    let request =  URLRequest(url: (myURL?.url)!)
//
//    dataTask = session.dataTask(with: request, completionHandler: {data, response, error in
//        if error == nil {
//
//            if let data = data {
//
//                do {
//                    let res = try JSONDecoder().decode(MainModel.self, from: data)
//                    for addiction in res.list!{
//
//                        if let weathers = addiction.weather{
//                            for addictionList in weathers{
//
//                                if let desc = addictionList.description,
//                                    let timestamp = addiction.dt{
//                                    let result = CustomArray(date: self.createDateTime(timestamp: timestamp), city: myCity, description: desc)
//                                    self.arrayWeather.append(result)
//                                    DispatchQueue.main.async {
//                                        self.tableView.reloadData()
//                                    }
//                                }
//
//                            }
//                        }
//
//                    }
//                } catch let error{
//                    print(error)
//                }
//            }
//        }
//    })
//
//
//    dataTask?.resume()
//
//}
