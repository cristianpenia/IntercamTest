//
//  HomeHomeViewInput.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

protocol HomeViewInput: AnyObject {

    func setupInitialState()
    func showError(title: String, message: String)
    func showErrorConfiguration(title: String, message: String)
}
