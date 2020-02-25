//
//  OYHome.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/9/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYHome: OYHomeBaseViewController {
    
    let blankPageWarning = OYBlankPageWarning()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewComponents()
        
        self.tableViewWeather.delegate = self
        self.tableViewWeather.dataSource = self
        self.tableViewWeather.rowHeight = UITableView.automaticDimension
        self.tableViewWeather.estimatedRowHeight = 300
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: String(describing: OYHome.self)), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        OYBaseNetworkManager.checkInternetConnection(uiView: self.view)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchData()
        
    }
    
    @objc func refresh() {
        
        blankPageWarning.remove()
        fetchData()
        
    }
    
    func fetchData() {
        
        self.getWeather(city: "istanbul", key: OYConstants.WEATHER_KEY, success: { (response) in
            
//            response
//                ? self.tableViewWeather.reloadData()
//                : OYCustomMessages.shared.long(self.view, txt_msg: "An error has occured.")
            
            if !self.weatherArray.isEmpty && response {
                
                self.tableViewWeather.isHidden = false
                self.tableViewWeather.reloadData()
                
            }else if self.weatherArray.isEmpty && response{
                
                self.tableViewWeather.isHidden = true
                self.blankPageWarning.setup(self.view, text: "No data found.", imageName: "iconSearch", buttonName: "Refresh", notificationName: String(describing: OYHome.self))
                
            }else {
                
                self.tableViewWeather.isHidden = true
                self.blankPageWarning.setup(self.view, text: "An error has occured.", imageName: "iconSearch", buttonName: "Refresh", notificationName: String(describing: OYHome.self))
                
            }
            
            
        }){ (Error, statusCode) in
            
            self.tableViewWeather.isHidden = true
            self.blankPageWarning.setup(self.view, text: "An error has occured.", imageName: "iconSearch", buttonName: "Refresh", notificationName: String(describing: OYHome.self))
            
        }
        
    }
    
    
    // MARK: *** Button Tap Actions
    @IBAction func tapBtnSearch(sender: UIButton) {
        print("search")
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
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableViewWeather.cellForRow(at: indexPath){
            cell.contentView.backgroundColor = .customColorGrey
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableViewWeather.cellForRow(at: indexPath){
            cell.contentView.backgroundColor = .clear
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let homeView: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let weather = homeView.instantiateViewController(withIdentifier: "homeDetail") as! OYHomeDetail
        weather.weatherForecast = self.weatherArray[indexPath.row].description
        self.navigationController?.pushViewController(weather, animated: true)
        
    }
    
}






//MARK: *** Without using Alamofire
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
//
//                    if let list = res.list{
//                        for addiction in list{
//
//                            if let weathers = addiction.weather{
//                                for addictionList in weathers{
//
//                                    if let desc = addictionList.description,
//                                        let timestamp = addiction.dt{
//                                        let result = CustomArray(date: self.createDateTime(timestamp: timestamp), city: myCity, description: desc)
//                                        self.arrayWeather.append(result)
//                                    }
//
//                                }
//                            }
//
//                        }
//                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
//                        }
//                    }
//
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




