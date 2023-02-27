//
//  Joke.swift
//  mvvm-swiftui-demo
//
//  Created by Quang Luu on 27/02/2023.
//

import Foundation

struct Joke: Decodable, Identifiable {
    var id: String
    var joke: String
    var status: Int
}
