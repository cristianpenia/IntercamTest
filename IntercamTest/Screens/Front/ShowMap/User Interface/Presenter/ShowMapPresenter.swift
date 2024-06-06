//
//  ShowMapShowMapPresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

class ShowMapPresenter: ShowMapModuleInput, ShowMapViewOutput, ShowMapInteractorOutput {

    weak var view: ShowMapViewInput!
    var interactor: ShowMapInteractorInput!
    var router: ShowMapRouterInput!

    func viewIsReady() {

    }
}
