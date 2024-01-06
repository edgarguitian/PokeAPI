//
//  PokemonDetailFactory.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class PokemonDetailFactory: CreatePokemonDetailView {
    func create(with pokemon: PokemonListPresentableItem) -> PokemonDetailView {
        return PokemonDetailView(viewModel: createViewModel(pokemon: pokemon))
    }
    
    func createViewModel(pokemon: PokemonListPresentableItem) -> PokemonDetailViewModel {
        return PokemonDetailViewModel(pokemonDetailInfo: pokemon)
    }
    
    
}
