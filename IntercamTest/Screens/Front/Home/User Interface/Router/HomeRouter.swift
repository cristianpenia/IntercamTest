//
//  HomeHomeRouter.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterInput, Routable {
    
    weak var view: HomeViewController!
    
    func routeToListAirports(list: AirportsResponse) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        pushViewController(withIdentifer: "AirportsViewController",
                           type: AirportsViewController.self,
                           in: storyboard,
                           from: view) { airports in
            
            let configurator = AirportsModuleConfigurator()
            
            configurator.configure(viewController: airports )
        }
    }
}
