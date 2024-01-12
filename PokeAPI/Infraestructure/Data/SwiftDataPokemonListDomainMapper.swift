//
//  SwiftDataPokemonListDomainMapper.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 11/1/24.
//

import Foundation

class SwiftDataPokemonListDomainMapper {
    func map(_ pokemonsList: [PokemonListData], page: Int) -> PokemonListInfoResponse {
        let result = pokemonsList.map {
            PokemonListInfo(id: $0.id, name: $0.name, image: $0.image)
        }
        if pokemonsList.isEmpty {
            return PokemonListInfoResponse(results: result, count: 0, page: page)
        } else {
            let lastPokemon = pokemonsList[pokemonsList.count - 1]
            return PokemonListInfoResponse(results: result, count: lastPokemon.count, page: page)
        }
    }
}
