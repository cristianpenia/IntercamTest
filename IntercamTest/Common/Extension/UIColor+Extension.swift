//
//  UIColor+Extension.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 05/06/24.
//

import UIKit

extension UIColor {
    
    static func newColor(with name: String) -> UIColor {
        return UIColor(named: name) ?? UIColor.orange
    }
}
