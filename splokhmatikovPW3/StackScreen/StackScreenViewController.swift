//
//  TableScreenViewController.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import UIKit


class StackScreenViewController: UIViewController {
    private var stack: UIStackView = UIStackView()
    private var alarms: [Alarm] = []
    private var elderScroll: UIScrollView = UIScrollView()
    private let dataManager:DataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    private func setupStackView() {
        elderScroll.frame = view.frame
        elderScroll.translatesAutoresizingMaskIntoConstraints = false
        elderScroll.alwaysBounceVertical = true
        view.backgroundColor = .white
        view.addSubview(elderScroll)
        elderScroll.addSubview(stack)
        stack.backgroundColor = #colorLiteral(red: 0.6811034083, green: 0.9382398725, blue: 0.6863567233, alpha: 1)
        stack.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        stack.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        stack.pin(to: view, .left, .right)
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 10
        alarms = dataManager.getAlarms()
        alarms.sort(by: {$0.time < $1.time})
        setAlarms()
    }
    
    private func setAlarms() {
        stack.subviews.forEach({ $0.removeFromSuperview()})
        elderScroll.contentSize.height = 0
        for i in 0..<alarms.count {
            let alarm = StackAlarmView()
            alarm.initView()
            if alarms[i].time%60 > 9{
                alarm.setTime(time: "\(alarms[i].time/60):\(alarms[i].time%60)")
                
            } else{
                alarm.setTime(time: "\(alarms[i].time/60):0\(alarms[i].time%60)")
            }
            alarm.setDescription(description: alarms[i].descriptionLabel)
            alarm.setSwitch(isOn: alarms[i].isOn)
            let systemLayoutSizeFitting = alarm.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            elderScroll.contentSize.height += systemLayoutSizeFitting.height + 10
            stack.addArrangedSubview(alarm)
        }
    }
    
}
