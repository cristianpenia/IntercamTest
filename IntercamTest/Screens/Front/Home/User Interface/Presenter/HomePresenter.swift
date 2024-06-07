//
//  HomeHomePresenter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import CoreLocation

class HomePresenter {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    var range = 0
    
}

extension HomePresenter: HomeModuleInput {
    func viewIsReady() {}
}

extension HomePresenter: HomeViewOutput {
    
    func searchAirportIn(_ range: Int) {
        view.displayLoader()
        
        self.range = range
        
        interactor.getLocation()
    }
}

extension HomePresenter: HomeInteractorOutput {
    
    func didGetLocation(_ location: CLLocation) {
        
        let latitud = location.coordinate.latitude
        let longitud = location.coordinate.longitude
        
        print("\n\nlatitud \(latitud), longitud \(longitud)\n\n")
        
        interactor.getAirports(with: latitud, and: longitud, in: range)
        
        range = 0
    }
    
    func didFailGettingLocation(title: String, message: String) {
        view.removeLoader()
        view.showErrorConfiguration(title: title, message: message)
    }
    
    func didGetAirports(list: AirportsResponse) {
        view.removeLoader()
        router.routeToListAirports(list: list)
    }
    
    func didFailGettingAirports(title: String, message: String) {
        view.removeLoader()
        view.showError(title: title, message: message)
    }
}
