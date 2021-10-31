//
//  Sdks.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import Foundation

struct Sdks: Decodable {
    var macOS, tvOS, iOS, watchOS: [Clang]?
}
