//
//  HomePageRouter.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import UIKit

protocol IHomePageRouter: class {
    func navigateToDetail(relatedHeroes: [Hero.Response], selectedHero: Hero.Response)
}

class HomePageRouter: IHomePageRouter {
    weak var view: HomePageView?

    init(view: HomePageView?) {
        self.view = view
    }

    func navigateToDetail(relatedHeroes: [Hero.Response], selectedHero: Hero.Response) {
        self.view?.navigate(type: .push, module: GeneralRouter.detail(parameter: ["relatedHeroes": relatedHeroes, "selectedHero": selectedHero]), completion: nil)
    }
}
