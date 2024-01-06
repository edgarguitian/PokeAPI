//
//  SinglePokemonDomainMapper.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class SinglePokemonDomainMapper {
    func map(domain: PokemonListInfoDTO) -> SinglePokemonInfo {
        
        return SinglePokemonInfo(id: String(domain.id), name: domain.name, baseExperience: String(domain.baseExperience), height: String(domain.height), weight: String(domain.weight),
                                 abilities: [], forms: [], gameIndices: [], heldItems: [], locationAreaEncounters: domain.locationAreaEncounters,
                                 moves: [], species: PokemonNameUrl(name: domain.species.name, url: domain.species.url),
                                 sprites: PokemonSprites(frontDefault: domain.sprites.frontDefault,
                                                         backDefault: domain.sprites.backDefault,
                                                         backShiny: domain.sprites.backShiny,
                                                         frontShiny: domain.sprites.frontShiny),
                                 stats: [], types: [], pastTypes: [])

    }
}
