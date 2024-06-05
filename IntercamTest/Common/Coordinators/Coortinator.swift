//
//  Coortinator.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 05/06/24.
//

import UIKit

protocol Coordinator {
    
    
    // MARK: Properties
    
    var viewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    
    
    // MARK: Functions
    
    func start()
}


extension Coordinator {
    
    var viewController: UIViewController? { nil }
    var navigationController: UINavigationController? { nil }
}
