//
//  GPSLocationService.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 05/06/24.
//

import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    private var completion: ((Result<CLLocation, Error>) -> Void)?
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()  // o locationManager.requestAlwaysAuthorization()
    }
    
    func getCurrentLocation(completion: @escaping (Result<CLLocation, Error>) -> Void) {
        self.completion = completion
        
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            locationManager.startUpdatingLocation()
        } else {
            
            completion(.failure(NSError(domain: "LocationService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Location services are not authorized."])))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            
            break
        case .denied, .restricted:
            
            completion?(.failure(NSError(domain: "LocationService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Location services are not authorized."])))
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            completion?(.success(location))
            locationManager.stopUpdatingLocation()
            completion = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completion?(.failure(error))
        locationManager.stopUpdatingLocation()
        completion = nil
    }
}
