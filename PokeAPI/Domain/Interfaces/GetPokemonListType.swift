//
//  GetPokemonListType.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

protocol GetPokemonListType {
    func execute() async -> Result<PokemonListResponse, PokemonDomainError>
}
