//
//  PokemonListPresentableItem.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

struct PokemonListPresentableItem {
    let id: String
    let name: String
    let image: URL
}

extension PokemonListPresentableItem: Hashable {

}
