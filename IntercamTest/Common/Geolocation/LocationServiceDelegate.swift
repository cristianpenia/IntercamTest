//
//  LocationService.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 05/06/24.
//

import CoreLocation

protocol LocationServiceDelegate: AnyObject {
    func didUpdateLocation(latitude: Double, longitude: Double)
    func didFailWithError(error: Error)
}
