//
//  ShowListShowListPresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

class ShowListPresenter {

    weak var view: ShowListViewInput!
    var interactor: ShowListInteractorInput!
    var router: ShowListRouterInput!

    func viewIsReady() {

    }
}


// MARK: ShowListModuleInput

extension ShowListPresenter: ShowListModuleInput {
    func initializeModule(airports: [Airport]) {
        view.setupInitialState(airports: airports)
    }
}


// MARK: ShowListViewOutput

extension ShowListPresenter: ShowListViewOutput {
    
}


// MARK: ShowListInteractorOutput

extension ShowListPresenter: ShowListInteractorOutput {
    
}
