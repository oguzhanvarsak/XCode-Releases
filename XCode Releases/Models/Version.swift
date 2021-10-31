//
//  Version.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import Foundation

struct Version: Decodable {
    var number, build: String?
    var release: VersionRelease?
}
