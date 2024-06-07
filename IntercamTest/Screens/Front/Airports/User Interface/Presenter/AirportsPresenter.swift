//
//  AirportsAirportsPresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

class AirportsPresenter {

    weak var view: AirportsViewInput!
    var interactor: AirportsInteractorInput!
    var router: AirportsRouterInput!

    var airports: AirportsResponse?
}


// MARK: AirportsModuleInput

extension AirportsPresenter: AirportsModuleInput {
    
    func initializeModule(airports: AirportsResponse) {
        self.airports = airports
    }
}


// MARK: AirportsViewOutput

extension AirportsPresenter: AirportsViewOutput {
    
    func viewIsReady() {
        guard let airports = self.airports?.data.airpords else {
            return
        }
        
        view.setupInitialState(airports: airports)
    }
}


// MARK: AirportsInteractorOutput

extension AirportsPresenter: AirportsInteractorOutput {
    
}
