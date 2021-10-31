//
//  Compiler.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

import Foundation

struct Compiler: Decodable {
    var compilers: Compilers?
    var requires: String?
    var date: DateClass?
    var links: Links?
    var version: Version?
    var sdks: Sdks?
    var name: String?
    var checksums: Checksums?
}
