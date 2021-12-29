//
//  CollectionScreenViewController.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import UIKit

protocol CollectionScreenDisplayLogic {
    func dislayButtonPressed(viewModel: CollectionScreenModel.ButtonPressed.ViewModel)
}

class CollectionScreenViewController: UIViewController {
    typealias Model = CollectionScreenModel
    private var collection: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.systemRed
        setupCollectionView()
    }
    
    private func addNewAlarm(_ collection: UICollectionView, time: String, description: String, topMargin: Double) {
        let newAlarm = AlarmView()
        collection.addSubview(newAlarm)
        newAlarm.pinLeft(to: collection.safeAreaLayoutGuide.leadingAnchor)
        newAlarm.pinRight(to: collection.safeAreaLayoutGuide.trailingAnchor)
        newAlarm.pinTop(to: collection, topMargin)
        newAlarm.setHeight(to: 100)
        newAlarm.setTime(time: time)
        newAlarm.setDescription(description: description)
    }
    
    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 100, left: 100,
        bottom: 100, right: 100)
        layoutFlow.itemSize = CGSize(width: 100, height: 100)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        collection.backgroundColor = .white
        self.collection = collection
        for i in 0..<10{
            addNewAlarm(collection, time: "\(i)", description: "\(i)", topMargin: 100.0*Double(i))
        }
    }
    
    @objc
    func kek(){
        print("aaaa")
    }
}
