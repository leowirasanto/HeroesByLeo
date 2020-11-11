//
//  MainView.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation
import UIKit

class MainView: UINavigationController {
    override func viewDidLoad() {
        let home = UIViewController.initialModule(module: GeneralRouter.home)
        setViewControllers([home], animated: true)
    }
}
