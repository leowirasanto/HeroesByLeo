//
//  APIEndpoints.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Alamofire
import Foundation

enum HomePageEndpoint {
    case getAllHeroes
}

extension HomePageEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .getAllHeroes:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getAllHeroes:
            return Configs.baseUrl.rawValue + "/herostats"
        }
    }

    var parameter: Parameters? {
        switch self {
        case .getAllHeroes:
            return nil
        }
    }

    var header: HTTPHeaders? {
        switch self {
        case .getAllHeroes:
            return ["Content-Type": "application/json"]
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .getAllHeroes:
            return JSONEncoding.default
        }
    }
}
