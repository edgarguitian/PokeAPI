//
//  PokemonListRepositoryType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

protocol PokemonListRepositoryType {
    func getPokemonList(page: Int) async -> Result<PokemonListInfoResponse, PokemonDomainError>
}
