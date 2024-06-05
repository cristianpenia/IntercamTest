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

    func getAirports(with latitude: Float, and longitude: Float) {
        if true {
            output.didGetAirports()
        } else {
            output.didFailGettingAirports(title: "ocurrio un fallo", message: "porque no se enviaron los datos en la manera correcta")
        }
    }
}
