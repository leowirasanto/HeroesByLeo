//
//  HeroDetailModule.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation
import UIKit

class HeroDetailModule {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = HeroDetailView()
        let router = HeroDetailRouter(view: controller)
        let presenter = HeroDetailPresenter(view: controller)
        let manager = HeroDetailManager()
        let interactor = HeroDetailInteractor(presenter: presenter, manager: manager)

        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
