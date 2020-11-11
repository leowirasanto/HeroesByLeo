//
//  HomePageInteractor.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation

protocol IHomePageInteractor: class {
    var parameters: [String: Any]? { get set }
    func fetchHeroes(by filter: String)
    func fetchAllHeroes()
    func getAvailableFilter()
    func getRelatedHeroes(by selectedHero: Hero.Response)
}

class HomePageInteractor: IHomePageInteractor {
    private let presenter: IHomePagePresenter
    private let manager: IHomePageManager
    var parameters: [String: Any]?

    init(presenter: IHomePagePresenter, manager: IHomePageManager) {
        self.presenter = presenter
        self.manager = manager
    }

    func getAvailableFilter() {
        self.presenter.presentAvailableFilters()
    }

    func fetchHeroes(by filter: String) {
        self.presenter.presentHeroByFilter(filter)
    }

    func fetchAllHeroes() {
        manager.fetchAllHeroes { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let value):
                self.presenter.success(heroes: value)
            case .failure(let error):
                self.presenter.failure(heroError: error)
            }
        }
    }

    func getRelatedHeroes(by selectedHero: Hero.Response) {
        self.presenter.presentRelatedHeroes(selectedHero)
    }
}
