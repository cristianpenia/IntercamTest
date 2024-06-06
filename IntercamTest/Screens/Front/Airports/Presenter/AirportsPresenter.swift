//
//  AirportsAirportsPresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

class AirportsPresenter: AirportsModuleInput, AirportsViewOutput, AirportsInteractorOutput {

    weak var view: AirportsViewInput!
    var interactor: AirportsInteractorInput!
    var router: AirportsRouterInput!

    func viewIsReady() {

    }
}
