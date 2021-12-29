//
//  StackScreenInteractor.swift
//  splokhmatikovPW3
//
//  Created by Сергей Лохматиков on 20.10.2021.
//

import Foundation

protocol StackScreenBuisnessLogic {
    func loadButtonPressed(request: StackScreenModel.ButtonPressed.Request)
}

final class StackScreenInteractor {
    typealias Model = StackScreenModel
    
    weak var presenter: StackScreenPresentationLogic?
}

extension StackScreenInteractor: StackScreenBuisnessLogic {
    func loadButtonPressed(request: Model.ButtonPressed.Request) {
        presenter?.presentButtonPressed(response: Model.ButtonPressed.Response())
    }
}
