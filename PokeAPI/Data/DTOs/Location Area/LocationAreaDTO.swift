//
//  LocationAreaDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

// MARK: - LocationItemInfoDTO
struct LocationAreaDTO: Decodable {
    let id: Int
    let name: String
    let encounterMethodRates: [EncounterMethodRatesDTO]
    let location: NameUrlDTO
    let names: [NamesDTO]
    let pokemonEncounters: [PokemonEncountersDTO]

    enum CodingKeys: String, CodingKey {
        case id, name, location, names
        case encounterMethodRates = "encounter_method_rates"
        case pokemonEncounters = "pokemon_encounters"
    }
}

struct EncounterMethodRatesDTO: Decodable {
    let encounterMethod: NameUrlDTO
    let versionDetails: [VersionDetailsDTO]

    enum CodingKeys: String, CodingKey {
        case encounterMethod = "encounter_method"
        case versionDetails = "version_details"
    }
}

struct VersionDetailsDTO: Decodable {
    let rate: Int
    let version: NameUrlDTO

    enum CodingKeys: String, CodingKey {
        case rate, version
    }
}

struct NamesDTO: Decodable {
    let name: String
    let language: NameUrlDTO

    enum CodingKeys: String, CodingKey {
        case name, language
    }
}

struct PokemonEncountersDTO: Decodable {
    let pokemon: NameUrlDTO
    let versionDetails: [VersionDetail]

    enum CodingKeys: String, CodingKey {
        case pokemon
        case versionDetails = "version_details"
    }
}
