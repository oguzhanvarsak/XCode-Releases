//
//  Compilers.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import Foundation

struct Compilers: Decodable {
    var clang, swift, llvm, llvmGcc: [Clang]?
    var gcc: [Clang]?
}
