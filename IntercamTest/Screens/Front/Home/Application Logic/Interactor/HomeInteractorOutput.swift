//
//  HomeHomeInteractorOutput.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import Foundation

protocol HomeInteractorOutput: AnyObject {
    
    func didGetAirports(list: [Int])
    func didFailGettingAirports(title: String, message: String)
}
