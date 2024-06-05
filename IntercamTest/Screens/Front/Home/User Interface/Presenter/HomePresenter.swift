//
//  HomeHomePresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

class HomePresenter: HomeModuleInput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    func viewIsReady() {}
}

extension HomePresenter: HomeViewOutput {
    
    func searchAirportIn(_ range: Int) {
        
        // TODO: obtener coordenadas
        
        // TODO: con las coordenadas solicitar el servicio
        interactor.getAirports(with: 1.1, and: 2.2)
    }
}

extension HomePresenter: HomeInteractorOutput {
    
    func didGetAirports(list: [Int]) {
        // TODO: una vez obtenida la repuesta exitosa mandamos la informacion por router
        router.routeToListAirports(list: list)
    }
    
    func didFailGettingAirports(title: String, message: String) {
        // TODO: mostramos un alert por el fallo
    }
}
