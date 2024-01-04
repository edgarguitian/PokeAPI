//
//  GetPokemonList.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class GetPokemonList: GetPokemonListType {
    private let repository: PokemonListRepositoryType
    
    init(repository: PokemonListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<PokemonListResponse, PokemonDomainError> {
        
    }
}
