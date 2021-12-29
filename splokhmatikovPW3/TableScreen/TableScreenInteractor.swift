//
//  TableScreenInteractor.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import Foundation

protocol TableScreenBuisnessLogic {
    func loadButtonPressed(request: TableScreenModel.ButtonPressed.Request)
}

final class TableScreenInteractor {
    typealias Model = TableScreenModel
    
    weak var presenter: TableScreenPresentationLogic?
}

extension TableScreenInteractor: TableScreenBuisnessLogic {
    func loadButtonPressed(request: Model.ButtonPressed.Request) {
        presenter?.presentButtonPressed(response: Model.ButtonPressed.Response())
    }
}
