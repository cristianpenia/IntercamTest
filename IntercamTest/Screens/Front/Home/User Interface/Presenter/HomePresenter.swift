//
//  HomeHomePresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import CoreLocation

class HomePresenter: HomeModuleInput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    var range = 0

    func viewIsReady() {}
}

extension HomePresenter: HomeViewOutput {
    
    func searchAirportIn(_ range: Int) {
        
        self.range = range
        interactor.getLocation()
        
    }
}

extension HomePresenter: HomeInteractorOutput {
    
    func didGetLocation(_ location: CLLocation) {
        
        let latitud = location.coordinate.latitude
        let longitud = location.coordinate.longitude
        
        print("latitud \(latitud), longitud \(longitud)")
        
        interactor.getAirports(with: latitud, and: longitud, in: range)
        
        range = 0
    }
    
    func didFailGettingLocation(title: String, message: String) {
        // TODO: mostramos un alert por el fallo
        print("\(title)\n\(message)")
    }
    
    func didGetAirports(list: AirportsResponse) {
        // TODO: una vez obtenida la repuesta exitosa mandamos la informacion por router
        router.routeToListAirports(list: list)
    }
    
    func didFailGettingAirports(title: String, message: String) {
        // TODO: mostramos un alert por el fallo
        print("\(title)\n\(message)")
    }
}
