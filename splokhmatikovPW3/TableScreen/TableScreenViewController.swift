//
//  TableScreenViewController.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import UIKit

protocol TableScreenDisplayLogic {
    func dislayButtonPressed(viewModel: TableScreenModel.ButtonPressed.ViewModel)
}

class TableScreenViewController: UIViewController {
    typealias Model = TableScreenModel
    private var collection: UICollectionView?
    private var interactor: TableScreenBuisnessLogic?
    
    func setupViewController(interactor: TableScreenBuisnessLogic) {
        self.interactor = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        interactor?.loadButtonPressed(request: TableScreenModel.ButtonPressed.Request())
        view.backgroundColor = UIColor.systemBlue
        setupTableView()
    }
    private func setupTableView() {
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

extension TableScreenViewController: TableScreenDisplayLogic {
    func dislayButtonPressed(viewModel: Model.ButtonPressed.ViewModel) {
        
    }
}
