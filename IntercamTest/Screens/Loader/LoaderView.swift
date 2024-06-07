//
//  LoaderView.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 06/06/24.
//

import UIKit
import SnapKit

class LoaderView: UIView {
    
    private var activityIndicator: UIActivityIndicatorView
    
    override init(frame: CGRect) {
        activityIndicator = UIActivityIndicatorView(style: .large)
        
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        activityIndicator = UIActivityIndicatorView(style: .large)
        
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(white: 0, alpha: 0.4)
        
        self.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
        
        self.isHidden = false
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
        
        self.isHidden = true
    }
}

