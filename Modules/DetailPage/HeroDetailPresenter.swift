//
//  HeroDetailPresenter.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation

protocol IHeroDetailPresenter {
    func presentHeroDetail(param: [String: Any]?)
}

class HeroDetailPresenter: IHeroDetailPresenter {
    weak var view: HeroDetailView?
    private var hero: Hero.Response?

    init(view: HeroDetailView?) {
        self.view = view
    }

    func presentHeroDetail(param: [String: Any]?) {
        let related = param?["relatedHeroes"] as? [Hero.Response]
        let selected = param?["selectedHero"] as? Hero.Response
        view?.displayHeroDetail(selected: selected, related: related ?? [])
    }
}

