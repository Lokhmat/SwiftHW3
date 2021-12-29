//
//  TableScreenAssembly.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import UIKit

final class TableScreenAssembly {
    func build() -> UIViewController {
        let interactor = TableScreenInteractor()
        let vc = TableScreenViewController()
        vc.setupViewController(interactor: interactor)
        let presenter = TableScreenPresenter()
        interactor.presenter = presenter
        presenter.viewController = vc
        
        return vc
    }
}
