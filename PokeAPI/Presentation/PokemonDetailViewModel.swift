//
//  PokemonDetailViewModel.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    @Published var pokemonDetailInfo: PokemonListPresentableItem
    
    init(pokemonDetailInfo: PokemonListPresentableItem) {
        self.pokemonDetailInfo = pokemonDetailInfo
    }
}
