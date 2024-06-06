//
//  Airpord.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 06/06/24.
//

import Foundation


// MARK: - Airpord

struct Airpord: Decodable {
    let ident, type, name: String
    let latitudeDeg, longitudeDeg: Double
    let elevationFt: Int
    let continent, isoCountry, isoRegion, municipality: String
    let scheduledService, gpsCode, iataCode, localCode: String
    let homeLink: String
    let wikipediaLink: String
    let keywords, icaoCode: String

    enum CodingKeys: String, CodingKey {
        case ident, type, name
        case latitudeDeg = "latitude_deg"
        case longitudeDeg = "longitude_deg"
        case elevationFt = "elevation_ft"
        case continent
        case isoCountry = "iso_country"
        case isoRegion = "iso_region"
        case municipality
        case scheduledService = "scheduled_service"
        case gpsCode = "gps_code"
        case iataCode = "iata_code"
        case localCode = "local_code"
        case homeLink = "home_link"
        case wikipediaLink = "wikipedia_link"
        case keywords
        case icaoCode = "icao_code"
    }
}
