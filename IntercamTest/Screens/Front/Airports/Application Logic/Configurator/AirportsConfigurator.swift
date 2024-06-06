//
//  AirportsAirportsConfigurator.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class AirportsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AirportsViewController {
            configure(viewController: viewController)
        }
    }

    func configure(viewController: AirportsViewController) {

        let router = AirportsRouter()

        let presenter = AirportsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AirportsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
