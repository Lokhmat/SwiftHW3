//
//  CollectionView.swift
//  splokhmatikovPW3
//
//  Created by Sergey Lokhmatikov on 29.12.2021.
//

import UIKit

class CollectionScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var collection: UICollectionView = {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 30, left: 15,
                                               bottom: 20, right: 15)
        layoutFlow.itemSize = CGSize(width: 175, height: 100)
        return UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
    }()
    private var dataManager: DataManager = DataManager()
    
    fileprivate func setupView() {
        view.backgroundColor = .white
        collection.register(CollectionAlarmView.self, forCellWithReuseIdentifier: "\(CollectionAlarmView.self)")
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = #colorLiteral(red: 0.9353832006, green: 0.9105941057, blue: 0.6760123968, alpha: 1)
        collection.alwaysBounceVertical = true
        collection.contentInsetAdjustmentBehavior = .always
        view.addSubview(collection)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collection.reloadData()
    }
    
    private func addNewAlarm(_ collection: UICollectionView, time: String, description: String, topMargin: Double) {
        let newAlarm = CollectionAlarmView()
        collection.addSubview(newAlarm)
        newAlarm.setHeight(to: 100)
        newAlarm.setTime(time: time)
        newAlarm.setDescription(description: description)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataManager.getAlarms().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionAlarmView.self)", for: indexPath) as? CollectionAlarmView else {
            return UICollectionViewCell()
        }
        let alarm = dataManager.getAlarms()[indexPath.row]
        cell.setDescription(description: alarm.descriptionLabel)
        cell.alarmSwitch.tag = indexPath.row
        cell.alarmSwitch.addTarget(self, action: #selector(change(sender: )), for: .valueChanged)
        cell.setSwitch(isOn: alarm.isOn)
        if alarm.time%60 > 9{
            cell.setTime(time: "\(alarm.time/60):\(alarm.time%60)")
            
        } else{
            cell.setTime(time: "\(alarm.time/60):0\(alarm.time%60)")
        }
        return cell
    }
    
    @objc
    func change(sender: UISwitch){
        dataManager.editAlarm(id: sender.tag)
    }
}
