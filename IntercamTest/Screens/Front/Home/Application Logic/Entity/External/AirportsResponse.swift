//
//  AirportsResponse.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 06/06/24.
//

import Foundation


// MARK: - AirportsResponse

struct AirportsResponse: Decodable {
    let status: String
    let data: DataAirports
}
