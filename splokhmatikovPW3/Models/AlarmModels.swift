//
//  CollectionScreenModels.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import Foundation

struct Alarm{
    public let time: Int
    public let descriptionLabel: String
}

class DataManager{
    private static var alarms: [Alarm] = []
    
    public static func getAlarms() -> [Alarm]{
        if alarms.count == 0 {
            for _ in 10..<30{
                alarms.append(Alarm(time: Int.random(in: 0...1440), descriptionLabel: "Wake the fuck up samurai"))
            }
            return alarms
        }
        else{
            return alarms
        }
    }
}
