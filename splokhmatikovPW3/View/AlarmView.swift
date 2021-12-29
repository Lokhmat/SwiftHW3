//
//  AlarmView.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 28.10.2021.
//

import UIKit

class AlarmView: UIView {
    private let timeLabel = UILabel()
    private let alarmSwitch = UISwitch()
    private let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView(){
        self.addSubview(alarmSwitch)
        self.addSubview(timeLabel)
        self.addSubview(descriptionLabel)
        alarmSwitch.pinRight(to: self, 20)
        alarmSwitch.pinCenter(to: self.centerYAnchor)
        timeLabel.pinLeft(to: self, 30)
        timeLabel.pinTop(to: self, 10)
        timeLabel.font = timeLabel.font.withSize(30)
        descriptionLabel.pinLeft(to: self, 30)
        descriptionLabel.pinCenter(to: self.centerYAnchor)
        descriptionLabel.font = descriptionLabel.font.withSize(15)
    }
    
    public func setTime(time: String){
        timeLabel.text = time
    }
    
    public func setDescription(description: String){
        descriptionLabel.text = description
    }
}


