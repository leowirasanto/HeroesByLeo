//
//  UIViewController.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation
import UIKit

enum DeviceOrientation {
    case portrait
    case landscape
}

extension UIViewController {
    var orientation: DeviceOrientation {
        let size = UIScreen.main.bounds
        return size.width > size.height ? .landscape : .portrait
    }
}
