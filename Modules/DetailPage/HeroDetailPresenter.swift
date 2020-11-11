//
//  HeroDetailPresenter.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation

protocol IHeroDetailPresenter {
}

class HeroDetailPresenter: IHeroDetailPresenter {
    weak var view: HeroDetailView?
    private var hero: Hero.Response?

    init(view: HeroDetailView?) {
        self.view = view
    }
}

