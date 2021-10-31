//
//  NetworkUtility.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import Foundation

typealias MYJSON = [String: AnyObject]

protocol JsonInitializable {
    init (json: MYJSON) throws
}

protocol JsonConvertable {
    func toJson() -> MYJSON
}

