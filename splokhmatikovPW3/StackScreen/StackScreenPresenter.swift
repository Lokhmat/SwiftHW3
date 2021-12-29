//
//  StackScreenPresenter.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import Foundation

protocol StackScreenPresentationLogic: AnyObject {
    func presentButtonPressed(response: StackScreenModel.ButtonPressed.Response)
}

final class StackScreenPresenter {
    typealias Model = StackScreenModel
    var viewController: StackScreenDisplayLogic?
}

extension StackScreenPresenter: StackScreenPresentationLogic {
    func presentButtonPressed(response: Model.ButtonPressed.Response) {
        viewController?.dislayButtonPressed(viewModel: Model.ButtonPressed.ViewModel())
    }
}
