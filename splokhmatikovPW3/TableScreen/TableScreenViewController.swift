//
//  TableScreenViewController.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import UIKit


class TableScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var table: UITableView = UITableView()
    private let dataManager: DataManager = DataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView() {
        view.backgroundColor = .white
        view.addSubview(table)
        table.backgroundColor = #colorLiteral(red: 0.679145515, green: 0.7531579733, blue: 0.9471346736, alpha: 1)
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        table.pin(to: view, .left, .right)
        table.register(TableAlarmView.self, forCellReuseIdentifier: "\(TableAlarmView.self)")
        table.delegate = self
        table.dataSource = self
        table.layer.masksToBounds = true
        table.isScrollEnabled = true
        table.delaysContentTouches = true
        table.canCancelContentTouches = true
        table.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.getAlarms().count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "\(TableAlarmView.self)", for: indexPath) as? TableAlarmView else {
            return UITableViewCell()
        }
        let alarm = dataManager.getAlarms()[indexPath.row]
        cell.setDescription(description: alarm.descriptionLabel)
        cell.setSwitch(isOn: alarm.isOn)
        cell.alarmSwitch.tag = indexPath.row
        cell.alarmSwitch.addTarget(self, action: #selector(change(sender: )), for: .valueChanged)
        if alarm.time%60 > 9{
            cell.setTime(time: "\(alarm.time/60):\(alarm.time%60)")
            
        } else{
            cell.setTime(time: "\(alarm.time/60):0\(alarm.time%60)")
        }
        cell.initView()
        return cell
    }
    
    @objc
    func change(sender: UISwitch){
        dataManager.editAlarm(id: sender.tag)
    }
}
