//
//  PokemonListDomainMapper.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

class PokemonListDomainMapper {
    func map(domain: PokemonListResponseDTO) -> PokemonListResponse {
        var pokemonEntry: [PokemonEntry] = []
        for entry in domain.results {
            pokemonEntry.append(PokemonEntry(id: extractID(from: entry.url),
                                             name: entry.name,
                                             url: URL(string: entry.url)))
        }
        return PokemonListResponse(results: pokemonEntry)
    }

    private func extractID(from url: String) -> Int {
        guard let lastComponent = url.components(separatedBy: "/").last,
              let pokemonID = Int(lastComponent) else {
            return 0
        }
        return pokemonID
    }

    func map(infoDTO: PokemonListInfoDTO) -> PokemonListInfo {
        return PokemonListInfo(id: String(infoDTO.id),
                               name: infoDTO.name,
                               image: URL(string: infoDTO.sprites.frontDefault))
    }
}
