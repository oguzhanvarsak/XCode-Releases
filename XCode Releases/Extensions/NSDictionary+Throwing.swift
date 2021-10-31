//
//  NSDictionary+Throwing.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import Foundation

public enum CastingError: Error {
    case Failure(key: String)
}

extension Dictionary {
    func get<T>(key: String) throws -> T {
        guard let keyAs = key as? Key else {
            throw CastingError.Failure(key: "-")
        }
        guard let obj = self[keyAs], let objAs = obj as? T else {
            throw CastingError.Failure(key: key)
        }
        return objAs
    }
    
    func getOptional<T>(key: String) throws -> T? {
        guard let keyAs = key as? Key else {
            throw CastingError.Failure(key: "-")
        }
        guard let obj = self[keyAs], !(obj is NSNull) else {
            return nil
        }
        guard let objAs = obj as? T else {
            throw CastingError.Failure(key: key)
        }
        return objAs
    }
    
    
    func get<T: JsonInitializable>(key: String) throws -> T {
        guard let keyAs = key as? Key else {
            throw CastingError.Failure(key: "-")
        }
        guard let obj = self[keyAs], let objAs = obj as? [String: AnyObject] else {
            throw CastingError.Failure(key: key)
        }
        return try T(json: objAs)
    }
    
    func getOptional<T: JsonInitializable>(key: String) throws -> T? {
        guard let keyAs = key as? Key else {
            throw CastingError.Failure(key: "-")
        }
        guard let obj = self[keyAs], !(obj is NSNull) else {
            return nil
        }
        guard let objAs = obj as? [String: AnyObject] else {
            throw CastingError.Failure(key: key)
        }
        return try T(json: objAs)
    }
    
    func get<T: JsonInitializable>(key: String) throws -> [T] {
        guard let keyAs = key as? Key else {
            throw CastingError.Failure(key: "-")
        }
        guard let obj = self[keyAs], let objAs = obj as? [[String: AnyObject]] else {
            throw CastingError.Failure(key: key)
        }
        
        return try objAs.map { try T(json: $0)}
    }

    func getOptional<T: JsonInitializable>(key: String) throws -> [T]? {
        guard let keyAs = key as? Key else {
            throw CastingError.Failure(key: "-")
        }
        guard let obj = self[keyAs], !(obj is NSNull) else {
            return nil
        }
        guard let objAs = obj as? [[String: AnyObject]] else {
            throw CastingError.Failure(key: key)
        }
        return try objAs.map { try T(json: $0)}
    }
}

