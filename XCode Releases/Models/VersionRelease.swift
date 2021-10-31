//
//  VersionRelease.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import Foundation

struct VersionRelease: Decodable {
    var beta: Int?
    var release: Bool?
    var rc: Int?
    var gm: Bool?
    var gmSeed, dp: Int?
}
