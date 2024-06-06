//
//  HomeHomeInteractor.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

class HomeInteractor: HomeInteractorInput {
    
    
    // MARK: Properties
    
    weak var output: HomeInteractorOutput!
    let locationService: LocationService
    
    
    init(locationService: LocationService) {
        self.locationService = locationService
    }
    
    func getLocation() {
        locationService.getCurrentLocation { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let location):
                self.output.didGetLocation(location)
            case .failure(let failure):
                self.output.didFailGettingLocation(title: "ERROR", message: "Ocurrio un error inesperado al obtener la localización")
            }
        }
    }

    func getAirports(with latitude: Float, and longitude: Float) {
        if true {
            output.didGetAirports(list: Array(1...10))
        } else {
            output.didFailGettingAirports(title: "ocurrio un fallo", message: "porque no se enviaron los datos en la manera correcta")
        }
    }
}
