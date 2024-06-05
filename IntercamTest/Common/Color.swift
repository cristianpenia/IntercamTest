//
//  Colors.swift
//  IntercamTest
//
//  Created by Cristian Peña Barrios on 05/06/24.
//

import UIKit

public struct Color {
    
    struct Name {
        
        static let blueIntercam = "BlueIntercam"
        static let grayIntercam = "GrayIntercam"
    }
    
    public static let blueIntercam: UIColor = UIColor.newColor(with: Name.blueIntercam)
    public static let grayIntercam: UIColor = UIColor.newColor(with: Name.grayIntercam)
}
