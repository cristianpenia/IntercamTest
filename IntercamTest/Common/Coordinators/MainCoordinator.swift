//
//  MainCoordinator.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 05/06/24.
//

import UIKit

class MainCoordinator: Coordinator {
    
    
    // MARK: Properties
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        
        let configurator = HomeModuleConfigurator()
        
        configurator.configure(viewController: homeViewController as! HomeViewController)
        
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
