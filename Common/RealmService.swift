//
//  RealmService.swift
//  HeroesByLeo
//
//  Created by Leo on 12/11/20.
//

import Foundation
import RealmSwift

enum RealmError: Error {
    case empty
    case notFound
}

class RealmObject: Object {}

protocol IRealmService {
    var realm: Realm? { get }
}

extension IRealmService {
    var realm: Realm? {
        let _realm = try! Realm()
        return _realm
    }
}

class RealmService: IRealmService {
    static let share = RealmService()

    public func save<T: RealmObject>(_ object: List<T>, isUpdate: Bool = true, completion: (() -> Void)? = nil) {
        do {
            try! realm?.write {
                realm?.add(object, update: isUpdate ? .modified : .all)
                completion?()
            }
        }
    }

    public func saveCreate<T: RealmObject>(_ object: T, isUpdate: Bool = true, completion: (() -> Void)? = nil) {
        do {
            try! realm?.write {
                realm?.add(object, update: .all)
                completion?()
            }
        }
    }

    func get<T: RealmObject>(object: T.Type, primaryKey: Int, completion: @escaping (Swift.Result<T, RealmError>) -> Void) {
        do {
            guard let result = self.realm?.object(ofType: object, forPrimaryKey: primaryKey) else {
                completion(.failure(.notFound))
                return
            }
            completion(.success(result))
        }
    }

    func get<T: RealmObject>(object: T.Type, withFilter: String? = nil, completion: @escaping (Swift.Result<RealmSwift.Results<T>, RealmError>) -> Void) {
        guard let predicate = withFilter else {
            guard let result = self.realm?.objects(object) else {
                completion(.failure(RealmError.notFound))
                return
            }
            completion(.success(result))
            return
        }

        guard let result = self.realm?.objects(object).filter(NSPredicate(format: predicate)) else {
            completion(.failure(RealmError.notFound))
            return
        }

        if result.isEmpty {
            completion(.failure(RealmError.empty))
            return
        }

        completion(.success(result))
    }

    func get<T: RealmObject>(object: T.Type, withFilter: NSPredicate?, completion: @escaping (Swift.Result<RealmSwift.Results<T>, RealmError>) -> Void) {
        guard let predicate = withFilter else {
            guard let result = self.realm?.objects(object) else {
                completion(.failure(RealmError.notFound))
                return
            }
            completion(.success(result))
            return
        }

        guard let result = self.realm?.objects(object).filter(predicate) else {
            completion(.failure(RealmError.notFound))
            return
        }

        if result.isEmpty {
            completion(.failure(RealmError.empty))
            return
        }

        completion(.success(result))
    }

    func update<T: RealmObject>(object: T.Type, data: [String: Any]) {
        do {
            guard let result = self.realm?.objects(object) else {
                return
            }
            try! realm?.write {
                result.first?.setValuesForKeys(data)
            }
        }
    }

    func delete<T: RealmObject>(object: T.Type) {
        do {
            guard let result = self.realm?.objects(object) else {
                return
            }

            try! realm?.write {
                realm?.delete(result)
            }
        }
    }

    func deleteAll() {
        do {
            try! realm?.write {
                realm?.deleteAll()
            }
        }
    }
}

