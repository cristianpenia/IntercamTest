//
//  Extension+UIViewController.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 06/06/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Entendido",
                                         style: .cancel,
                                         handler: nil)
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertConfiguration(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Entendido",
                                         style: .cancel,
                                         handler: nil)
        
        let settingsAction = UIAlertAction(title: "Configuración",
                                           style: .default) { _ in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { success in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(settingsAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private struct LoaderConstants {
        static var loaderViewTag = 999999
    }
    
    func showLoader() {
        if let _ = self.view.viewWithTag(LoaderConstants.loaderViewTag) {
            return
        }
        
        let loaderView = LoaderView(frame: self.view.bounds)
        loaderView.tag = LoaderConstants.loaderViewTag
        loaderView.startAnimating()
        
        self.view.addSubview(loaderView)
        
        NSLayoutConstraint.activate([
            loaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loaderView.topAnchor.constraint(equalTo: self.view.topAnchor),
            loaderView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func hideLoader() {
        if let loaderView = self.view.viewWithTag(LoaderConstants.loaderViewTag) as? LoaderView {
            loaderView.stopAnimating()
            loaderView.removeFromSuperview()
        }
    }
    
}
