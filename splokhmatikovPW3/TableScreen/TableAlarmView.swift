//
//  TableAlarmView.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 28.10.2021.
//

import UIKit

class TableAlarmView: UITableViewCell {
    private let timeLabel = UILabel()
    public let alarmSwitch = UISwitch()
    private let descriptionLabel = UILabel()
    
    public func initView(){
        descriptionLabel.numberOfLines = 2
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(alarmSwitch)
        contentView.addSubview(timeLabel)
        contentView.addSubview(descriptionLabel)
        backgroundColor = #colorLiteral(red: 0.5050294995, green: 0.5598605871, blue: 0.9583502412, alpha: 1)
        alarmSwitch.pinRight(to: contentView, 20)
        alarmSwitch.pinCenter(to: contentView.centerYAnchor)
        timeLabel.pinLeft(to: contentView, 10)
        timeLabel.pinTop(to: contentView, 5)
        timeLabel.font = timeLabel.font.withSize(30)
        descriptionLabel.pinLeft(to: timeLabel.trailingAnchor, 10)
        descriptionLabel.pinRight(to: alarmSwitch.leadingAnchor, 10)
        descriptionLabel.pinBottom(to: contentView, 5)
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


