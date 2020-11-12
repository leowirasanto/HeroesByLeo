//
//  Configs.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation

enum Configs: String {
    case baseUrl = "https://api.opendota.com/api"
    case imageBaseUrl = "https://api.opendota.com"

    case melee = "melee"
    case ranged = "ranged"

    case relatedHero = "relatedHero"
    case selectedHeroId = "selectedHeroId"
}

enum PrimaryAttr: String {
    case int = "int"
    case agi = "agi"
    case str = "str"
}
