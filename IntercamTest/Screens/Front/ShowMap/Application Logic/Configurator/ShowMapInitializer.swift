//
//  ShowMapShowMapInitializer.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class ShowMapModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var showmapViewController: ShowMapViewController!

    override func awakeFromNib() {

        let configurator = ShowMapModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: showmapViewController)
    }

}
