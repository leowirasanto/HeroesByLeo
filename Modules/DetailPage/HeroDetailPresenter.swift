//
//  HeroDetailPresenter.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation
import RealmSwift

protocol IHeroDetailPresenter {
    func presentHeroDetail(param: [String: Any]?)
}

class HeroDetailPresenter: IHeroDetailPresenter {
    weak var view: HeroDetailView?
    private var hero: HeroRealm?
    private var realmService = RealmService.share

    init(view: HeroDetailView?) {
        self.view = view
    }

    func presentHeroDetail(param: [String: Any]?) {
        let related = param?[Configs.relatedHero.rawValue] as? [Hero.Response]
        let selectedId = param?[Configs.selectedHeroId.rawValue] as? Int
        view?.displayRelatedHero(related: related ?? [])
        getHero(by: selectedId ?? 0)
    }

    func getHero(by id: Int) {
        realmService.get(object: HeroRealm.self, primaryKey: id) { result in
            switch result {
            case .success(let result):
                let selectedHero = HeroRealm(value: result)
                self.view?.displaySelectedHero(selected: selectedHero)
            case .failure( _):
                self.view?.showAlert(error: .noData)
            }
        }
    }

    //TODO: Work In progress
    func getRelatedHero(by id: Int) {
//        realmService.get(object: HeroRealm.self, withFilter: NSPredicate(format: <#T##String#>, <#T##args: CVarArg...##CVarArg#>)) { result in
//            <#code#>
//        }
    }
}

