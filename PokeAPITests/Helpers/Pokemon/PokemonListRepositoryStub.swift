//
//  PokemonListRepositoryStub.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI

class PokemonListRepositoryStub: PokemonListRepositoryType {

    private let result: Result<PokeAPI.PokemonListInfoResponse, PokeAPI.PokemonDomainError>

    init(result: Result<PokeAPI.PokemonListInfoResponse, PokeAPI.PokemonDomainError>) {
        self.result = result
    }

    func getPokemonList(page: Int) async -> Result<PokeAPI.PokemonListInfoResponse, PokeAPI.PokemonDomainError> {
        return result
    }

}
