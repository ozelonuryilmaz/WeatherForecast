//
//  OYHomeBaseViewController.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/11/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYHomeBaseViewController: OYBaseViewController {
    
    let btnSearch = UIButton(type: .custom)
    var weatherArray: [OYModels.WeatherArray] = []
    var tableViewWeather: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupViewComponents() {
        
        //MARK: *** Navigation Bar
        self.setupNavigationBar(titleName: "")
        let navBarLogo = UIImageView(frame: CGRect(x: 0, y: 0, width: 138, height: 26))
        navBarLogo.contentMode = .scaleAspectFit
        navBarLogo.image = UIImage.init(named: "navBarLogo")
        self.navigationItem.titleView = navBarLogo
        
        btnSearch.setImage(UIImage(named: "iconSearch"), for: .normal)
        btnSearch.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let btnContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        btnContainerView.addSubview(btnSearch)
        let barButtonItem = UIBarButtonItem(customView: btnContainerView)
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        //MARK: *** Table View
        tableViewWeather = UITableView(frame: view.bounds, style: .plain)
        
        let cellNib = UINib(nibName: "OYHomeXib", bundle: nil)
        tableViewWeather.register(cellNib, forCellReuseIdentifier: "OYHomeXib")
        tableViewWeather.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        tableViewWeather.separatorStyle = .none
        view.addSubview(tableViewWeather)
        
        //Where will it layout guide?
        var layoutGuide:UILayoutGuide!
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            layoutGuide = view.layoutMarginsGuide
        }
        
        tableViewWeather.translatesAutoresizingMaskIntoConstraints = false
        tableViewWeather.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableViewWeather.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableViewWeather.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableViewWeather.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
    }
    
    func getWeather(city: String, key: String, success:@escaping (_ response: Bool) -> Void) -> Void {
        
        self.showProgressView()
        
        OYNetworkManager.forecast(city: city, key: key, success: { (response) in
            
            if response.cod == "200" {
                
                self.weatherArray.removeAll()
                
                if let list = response.list{
                    for addiction in list{
                        
                        if let weathers = addiction.weather{
                            for addictionList in weathers{
                                
                                if let desc = addictionList.description,
                                    let timestamp = addiction.dt{
                                    
                                    let result = OYModels.WeatherArray(date: OYHelper.convertTimestamp(timestamp: timestamp), city: city, description: desc)
                                    self.weatherArray.append(result)
                                    
                                }
                                
                            }
                        }
                        
                    }
                }
                
                success(true)
            }else {
                success(false)
            }
            
            self.hideProgressView()
            
        }) { (Error, statusCode) in
            self.hideProgressView()
        }

    }

}
