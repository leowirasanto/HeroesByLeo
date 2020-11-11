//
//  HomePageManager.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation

protocol IHomePageManager: class {
    func fetchAllHeroes(completion: @escaping (Result<[Hero.Response], HeroError>) -> Void)
}

class HomePageManager: IHomePageManager {
    private let service = NetworkService.share

    func fetchAllHeroes(completion: @escaping (Result<[Hero.Response], HeroError>) -> Void) {
        service.fetch(endpoint: HomePageEndpoint.getAllHeroes, completion: completion)
    }
}
