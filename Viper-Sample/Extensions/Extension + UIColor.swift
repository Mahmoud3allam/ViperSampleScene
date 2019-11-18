//
//  Extension + UIColor.swift
//  Viper-Sample
//
//  Created by Alchemist on 11/18/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import UIKit
//Generate Random Color
extension UIColor {
    static var random: UIColor {
        return .init(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    }
}
