//
//  ShowListShowListInitializer.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class ShowListModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var showlistViewController: ShowListViewController!

    override func awakeFromNib() {

        let configurator = ShowListModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: showlistViewController)
    }

}
