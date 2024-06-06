//
//  ShowListShowListPresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

class ShowListPresenter: ShowListModuleInput, ShowListViewOutput, ShowListInteractorOutput {

    weak var view: ShowListViewInput!
    var interactor: ShowListInteractorInput!
    var router: ShowListRouterInput!

    func viewIsReady() {

    }
}
