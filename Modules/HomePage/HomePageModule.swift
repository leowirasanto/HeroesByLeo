//
//  HomePageModule.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation
import UIKit

class HomePageModule {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = HomePageView()
        let router = HomePageRouter(view: controller)
        let presenter = HomePagePresenter(view: controller)
        let manager = HomePageManager()
        let interactor = HomePageInteractor(presenter: presenter, manager: manager)

        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
