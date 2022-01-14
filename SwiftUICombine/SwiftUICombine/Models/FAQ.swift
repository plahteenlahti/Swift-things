//
//  FAQ.swift
//  SwiftUICombine
//
//  Created by Perttu Lähteenlahti on 14.1.2022.
//

import Foundation

struct FAQ: Decodable, Identifiable {
    var id: Int
    var question: String
    var answer: String
}
