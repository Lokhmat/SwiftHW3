//
//  StackScreenViewController.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import UIKit

protocol StackScreenDisplayLogic {
    func dislayButtonPressed(viewModel: StackScreenModel.ButtonPressed.ViewModel)
}

class StackScreenViewController: UIViewController {
    typealias Model = StackScreenModel
    private var collection: UICollectionView?
    private var interactor: StackScreenBuisnessLogic?
    
    func setupViewController(interactor: StackScreenBuisnessLogic) {
        self.interactor = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        interactor?.loadButtonPressed(request: StackScreenModel.ButtonPressed.Request())
        view.backgroundColor = UIColor.systemGreen
        setupStackView()
    }
    
    private func setupStackView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 10,
        bottom: 10, right: 10)
        layoutFlow.itemSize = CGSize(width: 60, height: 60)
        let collection = UICollectionView(frame: .zero,
        collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        collection.backgroundColor = .white
        self.collection = collection
    }
}

extension StackScreenViewController: StackScreenDisplayLogic {
    func dislayButtonPressed(viewModel: Model.ButtonPressed.ViewModel) {
        
    }
}
