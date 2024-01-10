//
//  Equatable.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import Foundation
@testable import PokeAPI

extension PokemonListInfo: Equatable {
    public static func == (lhs: PokemonListInfo, rhs: PokemonListInfo) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.image == rhs.image
    }
    
    
}

extension PokemonListInfoResponse: Equatable {
    public static func == (lhs: PokemonListInfoResponse, rhs: PokemonListInfoResponse) -> Bool {
        return lhs.results == rhs.results
    }
    
    
}

extension SinglePokemonInfo: Equatable {
    public static func == (lhs: PokeAPI.SinglePokemonInfo, rhs: PokeAPI.SinglePokemonInfo) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.baseExperience == rhs.baseExperience &&
        lhs.height == rhs.height &&
        lhs.weight == rhs.weight &&
        lhs.abilities == rhs.abilities &&
        lhs.forms == rhs.forms &&
        lhs.gameIndices == rhs.gameIndices &&
        lhs.heldItems == rhs.heldItems &&
        lhs.locationAreaEncounters == rhs.locationAreaEncounters &&
        lhs.moves == rhs.moves &&
        lhs.species == rhs.species &&
        lhs.sprites == rhs.sprites &&
        lhs.stats == rhs.stats &&
        lhs.types == rhs.types &&
        lhs.pastTypes == rhs.pastTypes
    }
    
    
}

extension PokemonSprites: Equatable {
    public static func == (lhs: PokemonSprites, rhs: PokemonSprites) -> Bool {
        return lhs.frontDefault == rhs.frontDefault &&
        lhs.backDefault == rhs.backDefault &&
        lhs.backShiny == rhs.backShiny &&
        lhs.frontShiny == rhs.frontShiny
    }
    
    
}

extension SingleLocationInfo: Equatable {
    public static func == (lhs: SingleLocationInfo, rhs: SingleLocationInfo) -> Bool {
        return lhs.values == rhs.values
    }
    
    
}
