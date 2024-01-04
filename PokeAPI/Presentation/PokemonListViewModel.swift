//
//  PokemonListViewModel.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

final class PokemonListViewModel: ObservableObject {
    private let getPokemonList: GetPokemonListType
    private let errorMapper: PokemonPresentableErrorMapper
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    
    init(getPokemonList: GetPokemonListType, errorMapper: PokemonPresentableErrorMapper) {
        self.getPokemonList = getPokemonList
        self.errorMapper = errorMapper
    }
    
    
}
