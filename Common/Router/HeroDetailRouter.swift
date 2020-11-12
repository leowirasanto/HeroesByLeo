//
//  HeroDetailRouter.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import UIKit

protocol IHeroDetailRouter: class {
}

class HeroDetailRouter: IHeroDetailRouter {
    weak var view: HeroDetailView?

    init(view: HeroDetailView?) {
        self.view = view
    }
}
