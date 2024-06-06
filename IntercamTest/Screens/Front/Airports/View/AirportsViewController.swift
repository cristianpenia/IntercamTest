//
//  AirportsAirportsViewController.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class AirportsViewController: UIViewController, AirportsViewInput {

    var output: AirportsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AirportsViewInput
    func setupInitialState() {
    }
}
