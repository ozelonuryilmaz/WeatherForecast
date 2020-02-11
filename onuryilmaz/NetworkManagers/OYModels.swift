//
//  OYNetworkModels.swift
//  onuryilmaz
//
//  Created by Onur YILMAZ on 2/8/20.
//  Copyright © 2020 Onur YILMAZ. All rights reserved.
//

import UIKit

class OYModels: NSObject {
    
    // MARK: - Array Model
    struct WeatherArray {
        
        var date: String
        var city: String
        var description: String
        
        init(date: String, city: String, description: String) {
            self.date = date
            self.city = city
            self.description = description
        }

    }
    
    
    // MARK: - Network Model
    struct MainModel: Codable {
        
        let cod : String?
        let message : Double?
        let cnt : Int?
        let list : [List]?
        let city : City?

        enum CodingKeys: String, CodingKey {

            case cod = "cod"
            case message = "message"
            case cnt = "cnt"
            case list = "list"
            case city = "city"
        }
        
        struct List : Codable {
            
            let dt : Int?
            let main : Main?
            let weather : [Weather]?
            let clouds : Clouds?
            let wind : Wind?
            let sys : Sys?
            let dt_txt : String?

            enum CodingKeys: String, CodingKey {

                case dt = "dt"
                case main = "main"
                case weather = "weather"
                case clouds = "clouds"
                case wind = "wind"
                case sys = "sys"
                case dt_txt = "dt_txt"
            }
            
            struct Main : Codable {
                
                let temp : Double?
                let temp_min : Double?
                let temp_max : Double?
                let pressure : Double?
                let sea_level : Double?
                let grnd_level : Double?
                let humidity : Int?
                let temp_kf : Double?

                enum CodingKeys: String, CodingKey {

                    case temp = "temp"
                    case temp_min = "temp_min"
                    case temp_max = "temp_max"
                    case pressure = "pressure"
                    case sea_level = "sea_level"
                    case grnd_level = "grnd_level"
                    case humidity = "humidity"
                    case temp_kf = "temp_kf"
                }
            }
            
            struct Weather : Codable {
                let id : Int?
                let main : String?
                let description : String?
                let icon : String?

                enum CodingKeys: String, CodingKey {

                    case id = "id"
                    case main = "main"
                    case description = "description"
                    case icon = "icon"
                }
            }
            
            struct Clouds : Codable {
                let all : Int?

                enum CodingKeys: String, CodingKey {

                    case all = "all"
                }
            }
            
            struct Wind : Codable {
                let speed : Double?
                let deg : Double?

                enum CodingKeys: String, CodingKey {

                    case speed = "speed"
                    case deg = "deg"
                }
            }
            
            struct Sys : Codable {
                let pod : String?

                enum CodingKeys: String, CodingKey {

                    case pod = "pod"
                }
            }
        }
        
        struct City : Codable {
            let id : Int?
            let name : String?
            let coord : Coord?
            let country : String?

            enum CodingKeys: String, CodingKey {

                case id = "id"
                case name = "name"
                case coord = "coord"
                case country = "country"
            }
            
            struct Coord : Codable {
                let lat : Double?
                let lon : Double?

                enum CodingKeys: String, CodingKey {

                    case lat = "lat"
                    case lon = "lon"
                }
            }
        }
        
    }

}
