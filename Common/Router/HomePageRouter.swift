//
//  HomePageRouter.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import UIKit

protocol IHomePageRouter: class {
    func navigateToDetail(relatedHeroes: [Hero.Response], selectedId: Int)
}

class HomePageRouter: IHomePageRouter {
    weak var view: HomePageView?

    init(view: HomePageView?) {
        self.view = view
    }

    func navigateToDetail(relatedHeroes: [Hero.Response], selectedId: Int) {
        self.view?.navigate(type: .push, module: GeneralRouter.detail(parameter: [Configs.relatedHero.rawValue: relatedHeroes, Configs.selectedHeroId.rawValue: selectedId]), completion: nil)
    }
}
