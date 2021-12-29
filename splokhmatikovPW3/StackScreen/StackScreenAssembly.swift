//
//  StackScreenAssembly.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import UIKit

final class StackScreenAssembly {
    func build() -> UIViewController {
        let interactor = StackScreenInteractor()
        let vc = StackScreenViewController()
        vc.setupViewController(interactor: interactor)
        let presenter = StackScreenPresenter()
        interactor.presenter = presenter
        presenter.viewController = vc
        
        return vc
    }
}
