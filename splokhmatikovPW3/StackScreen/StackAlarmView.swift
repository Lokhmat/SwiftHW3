//
//  StackAlarmView.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 28.10.2021.
//

import UIKit

class StackAlarmView: UIView {
    private let timeLabel = UILabel()
    private let alarmSwitch = UISwitch()
    private let descriptionLabel = UILabel()
    
    public func initView(){
        descriptionLabel.numberOfLines = 2
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.lineBreakMode = .byWordWrapping
        self.addSubview(alarmSwitch)
        self.addSubview(timeLabel)
        self.addSubview(descriptionLabel)
        backgroundColor = #colorLiteral(red: 0.6121339202, green: 0.9396938086, blue: 0.6911064982, alpha: 1)
        alarmSwitch.pinRight(to: self, 20)
        alarmSwitch.pinCenter(to: self.centerYAnchor)
        timeLabel.pinLeft(to: self, 10)
        timeLabel.pinTop(to: self, 5)
        timeLabel.font = timeLabel.font.withSize(30)
        descriptionLabel.pinLeft(to: timeLabel.trailingAnchor, 10)
        descriptionLabel.pinRight(to: self, 10)
        descriptionLabel.pinBottom(to: self, 5)
        descriptionLabel.font = descriptionLabel.font.withSize(15)
    }
    
    public func setTime(time: String){
        timeLabel.text = time
    }
    
    public func setDescription(description: String){
        descriptionLabel.text = description
    }
    
    public func setSwitch(isOn: Bool){
        alarmSwitch.isOn = isOn
    }
}


