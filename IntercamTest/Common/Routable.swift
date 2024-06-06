//
//  Routable.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 06/06/24.
//

import UIKit

protocol Routable {
    
    func pushViewController(withIdentifer identifier: String, in storyBoard: UIStoryboard, from viewController: UIViewController)
    
    func pushViewController<T: UIViewController>(withIdentifer identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void)
}

extension Routable {
    
    func pushViewController(withIdentifer identifier: String, in storyBoard: UIStoryboard, from viewController: UIViewController) {
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func pushViewController<T: UIViewController>(withIdentifer identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void) {
        let bundle = Bundle(for: type)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier) as! T
        
        moduleConfiguration(nextViewController)
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
