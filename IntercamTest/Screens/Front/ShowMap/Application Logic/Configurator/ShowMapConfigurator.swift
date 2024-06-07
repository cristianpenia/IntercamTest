//
//  ShowMapShowMapConfigurator.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class ShowMapModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ShowMapViewController {
            configure(viewController: viewController)
        }
    }

    func configure(viewController: ShowMapViewController) {

        let router = ShowMapRouter()

        let presenter = ShowMapPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ShowMapInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
