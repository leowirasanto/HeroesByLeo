//
//  NetworkService.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Alamofire
import Foundation

protocol IEndpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameter: Parameters? { get }
    var header: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

class NetworkService {
    static let share = NetworkService()
    private let isConnectedToInternet = NetworkReachabilityManager()?.isReachable ?? false

    func fetch<T: Decodable>(endpoint: IEndpoint, completion: @escaping (Result<[T], HeroError>) -> Void) {
        AF.request(endpoint.path, method: endpoint.method, parameters: endpoint.parameter, encoding: endpoint.encoding, headers: endpoint.header)
            .response { (responseData) in
                guard self.isConnectedToInternet else {
                    completion(.failure(.noConnection))
                    return
                }
                guard let data = responseData.data else { return }
                do {
                    let result = try JSONDecoder().decode([T].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.noData))
                }
            }
    }

    func fetch<T: Decodable>(endpoint: IEndpoint, completion: @escaping (Result<T, HeroError>) -> Void) {
        AF.request(endpoint.path, method: endpoint.method, parameters: endpoint.parameter, encoding: endpoint.encoding, headers: endpoint.header)
            .response { (responseData) in
                guard self.isConnectedToInternet else {
                    completion(.failure(.noConnection))
                    return
                }
                guard let data = responseData.data else { return }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.noData))
                }
            }
    }
}
