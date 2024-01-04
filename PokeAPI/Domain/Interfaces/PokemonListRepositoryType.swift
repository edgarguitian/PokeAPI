//
//  PokemonListRepositoryType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

protocol PokemonListRepositoryType {
    func getPokemonList() async -> Result<PokemonListResponse, PokemonDomainError>
}
