//
//  CreatePokemonDetailView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

protocol CreatePokemonDetailView {
    func create(with pokemon: PokemonListPresentableItem) -> PokemonDetailView
}
