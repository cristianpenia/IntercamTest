//
//  HomeHomeInteractor.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInput {
    
    
    // MARK: Properties
    
    weak var output: HomeInteractorOutput!
    let locationService: LocationService
    
    // TODO: pasar al archivo correspondiente
    let titleFail = "Ocurrio un error"
    let messageFail = "lamentamos no haber podido concretar tu peticion, intentalo nuevamente"
    
    init(locationService: LocationService) {
        self.locationService = locationService
    }
    
    func getLocation() {
        locationService.getCurrentLocation { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let location):
                self.output.didGetLocation(location)
                
            case .failure( _):
                self.output.didFailGettingLocation(title: titleFail, message: "Al botener la coordenadas \n\(messageFail)")
            }
        }
    }
    
    func getAirports(with latitude: Double, and longitude: Double, in range: Int) {
        
        let apiKey = "47c3b837f99"
        
        let jsonData = loadJSONFromFile(named: "AirportsSuccess")
//        let jsonData = loadJSONFromFile(named: "AirportsFailed")
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, jsonData)
        }
        
        let session = setupMockedURLSession()
        let baseURL = "https://airports.com/api/test"
        
        guard var urlComponents = URLComponents(string: baseURL) else {
            output.didFailGettingAirports(title: titleFail, message: messageFail)
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "access_key", value: apiKey),
            URLQueryItem(name: "latitude", value: "\(latitude)"),
            URLQueryItem(name: "longitude", value: "\(longitude)"),
            URLQueryItem(name: "range", value: "\(range)")
        ]
        
        guard let url = urlComponents.url else {
            output.didFailGettingAirports(title: titleFail, message: messageFail)
            return
        }
        
        print("\n\n\(url)\n\n")
        
        let task = session.dataTask(with: url) { [self] data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                        
                let airportsResponse = try decoder.decode(AirportsResponse.self, from: data)
                    
                print("\n\n")
                dump(airportsResponse)
                print("\n\n")
                
                DispatchQueue.main.async {
                    self.output.didGetAirports(list: airportsResponse)
                }
            } catch {
                DispatchQueue.main.async {
                    self.output.didFailGettingAirports(title: self.titleFail, message: self.messageFail)
                }
            }
        }
        task.resume()
    }
}


extension HomeInteractor {
    
    func loadJSONFromFile(named fileName: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("JSON file not found")
        }
        
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Unable to read data from JSON file")
        }
        
        return data
    }

    func setupMockedURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        
        return URLSession(configuration: configuration)
    }
}
