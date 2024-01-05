//
//  PokemonListInfo.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

class PokemonListInfo {
    let id: String
    let name: String
    let image: URL?
    
    init(id: String, name: String, image: URL?) {
        self.id = id
        self.name = name
        self.image = image
    }
}
