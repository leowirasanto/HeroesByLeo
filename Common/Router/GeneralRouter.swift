//
//  GeneralRouter.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation
import UIKit

enum GeneralRouter: IRouter {
    // MARK: - List of views
    case home
    case detail(parameter: [String: Any])
//    case setting
}

extension GeneralRouter {
    // MARK: - Router Switcher
    var module: UIViewController? {
        switch self {
        case .home:
            return HomePageModule.setup()
        case .detail(let param):
            return HeroDetailModule.setup(parameters: param)
        }
    }
}
