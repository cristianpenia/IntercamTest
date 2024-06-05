//
//  HomeHomeViewController.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var output: HomeViewOutput!

    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}


// MARK: HomeViewInput

extension HomeViewController: HomeViewInput {
    
    func setupInitialState() {}
}
