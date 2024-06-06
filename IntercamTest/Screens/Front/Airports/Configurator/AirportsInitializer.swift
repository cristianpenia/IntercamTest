//
//  AirportsAirportsInitializer.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class AirportsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var airportsViewController: AirportsViewController!

    override func awakeFromNib() {

        let configurator = AirportsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: airportsViewController)
    }

}
