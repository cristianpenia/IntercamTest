//
//  ShowMapShowMapPresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

class ShowMapPresenter {

    weak var view: ShowMapViewInput!
    var interactor: ShowMapInteractorInput!
    var router: ShowMapRouterInput!

    var airports: [Airport]?
}


// MARK: ShowMapModuleInput

extension ShowMapPresenter: ShowMapModuleInput {
    
    func initializeModule(airports: [Airport]) {
        self.airports = airports
    }
}


// MARK: ShowMapViewOutput

extension ShowMapPresenter: ShowMapViewOutput {
    
    func viewIsReady() {
        guard let airports else { return }
        
        view.setupInitialState(airports: airports)
    }
}


// MARK: ShowMapInteractorOutput

extension ShowMapPresenter: ShowMapInteractorOutput {
    
}
