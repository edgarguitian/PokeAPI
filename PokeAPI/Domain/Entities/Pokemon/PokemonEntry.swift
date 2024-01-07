//
//  PokemonEntry.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

struct PokemonEntry {
    let id: Int
    var name: String
    var url: URL?
    
    init(id: Int, name: String, url: URL?) {
        self.id = id
        self.name = name
        self.url = url
    }
}
