//
//  HomeHomeInteractorOutput.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import CoreLocation

protocol HomeInteractorOutput: AnyObject {
    
    func didGetLocation(_ location: CLLocation)
    func didFailGettingLocation(title: String, message: String)
    func didGetAirports(list: AirportsResponse)
    func didFailGettingAirports(title: String, message: String)
}
