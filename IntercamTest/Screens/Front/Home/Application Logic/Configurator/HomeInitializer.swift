//
//  HomeHomeInitializer.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class HomeModuleInitializer: NSObject {
    
    @IBOutlet weak var homeViewController: HomeViewController!

    override func awakeFromNib() {

        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeViewController)
    }

}
