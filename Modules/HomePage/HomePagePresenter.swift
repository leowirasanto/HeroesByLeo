//
//  HomePagePresenter.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation

protocol IHomePagePresenter {
    func success(heroes: [Hero.Response])
    func failure(heroError: HeroError)

    func presentHeroByFilter(_ keyword: String)
    func presentAvailableFilters()
    func presentRelatedHeroes(_ selectedHero: Hero.Response)
}

class HomePagePresenter: IHomePagePresenter {
    weak var view: IHomePageView?
    private var heroes = [Hero.Response]()

    init(view: IHomePageView?) {
        self.view = view
    }

    func success(heroes: [Hero.Response]) {
        self.heroes = heroes
        view?.displayHeroes(heroes: heroes)
    }

    func failure(heroError: HeroError) {
        view?.displayErrorGetHeroes(error: heroError)
    }

    func presentHeroByFilter(_ keyword: String) {
        if keyword == "All" {
            view?.displayHeroes(heroes: self.heroes)
        } else {
            let filteredHeroes = heroes.filter({($0.roles?.contains(keyword) ?? false)})
            view?.displayHeroes(heroes: filteredHeroes)
        }
    }

    func presentAvailableFilters() {
        guard !heroes.isEmpty else { return }
        var filters: [String] = ["All"]
        heroes.forEach { hero in
            hero.roles?.forEach({ roles in
                if !filters.contains(roles) {
                    filters.append(roles)
                }
            })
        }
        view?.displayAvailableFilters(filters: filters)
    }

    func presentRelatedHeroes(_ selectedHero: Hero.Response) {
        let attr = selectedHero.primary_attr
        var result: [Hero.Response] = []
        let related = heroes.filter({ $0.primary_attr == attr }).sorted { (a, b) -> Bool in
            if attr == "agi" {
                guard let amov = a.move_speed, let bmov = b.move_speed else { return false }
                return amov > bmov
            } else if attr == "str" {
                guard let aatt = a.base_attack_max, let batt = b.base_attack_max else { return false }
                return aatt > batt
            } else if attr == "int" {
                guard let amana = a.base_mana, let bmana = b.base_mana else { return false }
                return amana > bmana
            }
            return false
        }
        if related.count >= 3 {
            result = Array(related.prefix(3))
        } else {
            result = related
        }
        view?.displayRelatedHeroes(related: result, selectedHero: selectedHero)
    }
}
