//
//  PokemonListInfoDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

struct PokemonListInfoDTO: Decodable {
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let weight: Int
    let abilities: [PokemonAbilitiesDTO]
    let forms: [PokemonNameUrlDTO]
    let gameIndices: [PokemonGameIndicesDTO]
    let heldItems: [PokemonHeldItemsDTO]
    let locationAreaEncounters: String
    let moves: [PokemonMovesDTO]
    let species: PokemonNameUrlDTO
    let sprites: PokemonSpritesDTO
    let stats: [PokemonStatsDTO]
    let types: [PokemonTypesDTO]
    let pastTypes: [PokemonPastTypesDTO]
    
    enum CodingKeys: String, CodingKey {
        case id, name, sprites, height, weight, abilities
        case forms, moves, species, types, stats
        case baseExperience = "base_experience"
        case gameIndices = "game_indices"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
        case pastTypes = "past_types"
    }
}
