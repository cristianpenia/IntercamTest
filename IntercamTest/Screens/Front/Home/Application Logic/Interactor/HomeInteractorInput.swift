//
//  HomeHomeInteractorInput.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import Foundation

protocol HomeInteractorInput {
    func getLocation()
    func getAirports(with latitude: Double,and longitude: Double)
}
