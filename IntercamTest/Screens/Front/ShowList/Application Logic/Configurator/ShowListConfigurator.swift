//
//  ShowListShowListConfigurator.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class ShowListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ShowListViewController {
            configure(viewController: viewController)
        }
    }

    func configure(viewController: ShowListViewController) {

        let router = ShowListRouter()

        let presenter = ShowListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ShowListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
