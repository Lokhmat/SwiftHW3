//
//  TableScreenPresenter.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import Foundation

protocol TableScreenPresentationLogic: AnyObject {
    func presentButtonPressed(response: TableScreenModel.ButtonPressed.Response)
}

final class TableScreenPresenter {
    typealias Model = TableScreenModel
    var viewController: TableScreenDisplayLogic?
}

extension TableScreenPresenter: TableScreenPresentationLogic {
    func presentButtonPressed(response: Model.ButtonPressed.Response) {
        viewController?.dislayButtonPressed(viewModel: Model.ButtonPressed.ViewModel())
    }
}
