//
//  HeroDetailInteractor.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation

protocol IHeroDetailInteractor: class {
    var parameters: [String: Any]? { get set }
}

class HeroDetailInteractor: IHeroDetailInteractor {
    private let presenter: IHeroDetailPresenter
    private let manager: IHeroDetailManager
    var parameters: [String: Any]?

    init(presenter: IHeroDetailPresenter, manager: IHeroDetailManager) {
        self.presenter = presenter
        self.manager = manager
    }
}
