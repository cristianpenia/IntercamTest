//
//  AirportsAirportsViewController.swift
//  IntercamTest
//
//  Created by Cristian Peña on 06/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class AirportsViewController: UITabBarController {
    
    
    // MARK: Views
    
    @IBOutlet weak var airportsTabBarController: UITabBar! {
        didSet {
            airportsTabBarController.backgroundColor = .white
        }
    }
    
    // MARK: Properties
    
    var output: AirportsViewOutput!

    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }
    
    private func setupTabBar(airports: [Airport]) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let showMapViewController = storyboard.instantiateViewController(withIdentifier: "ShowMapViewController") as! ShowMapViewController
        let showMapConfigurator = ShowMapModuleConfigurator()
        
        showMapConfigurator.configure(viewController: showMapViewController)
        
        showMapViewController.modelInput().initializeModule(airports: airports)
        
        let showListViewController = storyboard.instantiateViewController(withIdentifier: "ShowListViewController")  as! ShowListViewController
        let showListConfigurator = ShowListModuleConfigurator()
        
        showListConfigurator.configure(viewController: showListViewController)
        
        showListViewController.modelInput().initializeModule(airports: airports)
        
        showMapViewController.tabBarItem = UITabBarItem(title: .none,
                                                        image: UIImage(systemName: "mappin"),
                                                        tag: 0)
        showListViewController.tabBarItem = UITabBarItem(title: .none, 
                                                         image: UIImage(systemName: "list.dash"),
                                                         tag: 1)
        
        
        viewControllers = [showMapViewController, showListViewController]
    }
}


// MARK: AirportsViewInput

extension AirportsViewController: AirportsViewInput {
    
    func setupInitialState(airports: [Airport]) {
        setupTabBar(airports: airports)
    }
    
    func modelInput() -> AirportsModuleInput {
        return output as! AirportsModuleInput
    }
}
