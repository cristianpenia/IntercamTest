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
    
    @IBOutlet weak var airportTitleLabel: UILabel!
    
    @IBOutlet weak var finderSubTitleLabel: UILabel!
    
    @IBOutlet weak var numberKilometersLabel: UILabel! {
        didSet {
            numberKilometersLabel.textColor = Color.grayIntercam
        }
    }
    
    @IBOutlet weak var numberKilometersSlider: UISlider!
    
    @IBOutlet weak var radiusLabel: UILabel! {
        didSet {
            radiusLabel.textColor = Color.grayIntercam
        }
    }
    
    @IBOutlet weak var searchButton: UIButton! {
        didSet {
            searchButton.backgroundColor = Color.blueIntercam
            searchButton.layer.cornerRadius = 12
        }
    }
    
    
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
        
        custom(my: airportTitleLabel)
        custom(my: finderSubTitleLabel)
    }
    
    private func custom(my label: UILabel) {
        
        let attributedText = NSMutableAttributedString(string: label.text ?? "")
        
        attributedText.addAttribute(NSAttributedString.Key.strokeColor, 
                                    value: Color.grayIntercam,
                                    range: NSRange(location: 0,
                                                   length: attributedText.length))
        attributedText.addAttribute(NSAttributedString.Key.strokeWidth, 
                                    value: -2.0,
                                    range: NSRange(location: 0,
                                                   length: attributedText.length))
        
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, 
                                    value: UIColor.white,
                                    range: NSRange(location: 0,
                                                   length: attributedText.length))
        
        label.attributedText = attributedText
    }
    
    
    // MARK: Actions
    
    @IBAction func searchAction(_ sender: Any) {
        print("test search button")
    }
}


// MARK: HomeViewInput

extension HomeViewController: HomeViewInput {
    
    func setupInitialState() {}
}
