//
//  PokemonListData.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 11/1/24.
//

import Foundation
import SwiftData

@Model
class PokemonListData {
    @Attribute(.unique) let id: String
    let name: String
    let image: URL?
    let page: Int
    let count: Int

    init(id: String, name: String, image: URL?, page: Int, count: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.page = page
        self.count = count
    }
}
