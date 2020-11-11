//
//  HeroDetailManager.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation

protocol IHeroDetailManager: class {
}

class HeroDetailManager: IHeroDetailManager {
    private let service = NetworkService.share
}
