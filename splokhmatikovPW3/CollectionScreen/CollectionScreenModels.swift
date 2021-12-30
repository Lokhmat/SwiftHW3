//
//  CollectionScreenModels.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import Foundation

struct Alarm{
    public let timeLabel: String
    public let descriptionLabel: String
}

class DataManager{
    public static func getAlarms() -> [Alarm]{
        var alarms: [Alarm] = []
        for i in 10..<30{
            alarms.append(Alarm(timeLabel: "11:\(i)", descriptionLabel: "Wake the fuck up samurai"))
        }
        return alarms
    }
}
