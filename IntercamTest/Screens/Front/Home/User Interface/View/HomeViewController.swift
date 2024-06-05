//
//  HomeHomeViewController.swift
//  IntercamTest
//
//  Created by Cristian Peña on 05/06/2024.
//  Copyright © 2024 IntercamTest. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    // MARK: Views
    
    @IBOutlet weak var exampleLabel: UILabel!
    
    
    // MARK: Properties
    
    var output: HomeViewOutput!

    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        output.viewIsReady()
    }
    
    
    // MARK: Functions
    
    private func setupUI() {
        exampleLabel.text = "Hola"
    }
}


// MARK: HomeViewInput

extension HomeViewController: HomeViewInput {
    
    func setupInitialState() {}
}
