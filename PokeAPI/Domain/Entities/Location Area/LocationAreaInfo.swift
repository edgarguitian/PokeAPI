//
//  LocationAreaInfo.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

struct LocationAreaInfo {
    let id: String
    let name: String
    let encounterMethodRates: [EncounterMethodRates]
    let location: NameUrl
    let names: [Names]
    let pokemonEncounters: [PokemonEncounters]

    init(id: String, name: String, encounterMethodRates: [EncounterMethodRates],
         location: NameUrl, names: [Names], pokemonEncounters: [PokemonEncounters]) {
        self.id = id
        self.name = name
        self.encounterMethodRates = encounterMethodRates
        self.location = location
        self.names = names
        self.pokemonEncounters = pokemonEncounters
    }

    init(response: LocationAreaDTO) {
        self.id = String(response.id)
        self.name = response.name
        self.encounterMethodRates = response.encounterMethodRates.map { EncounterMethodRates(response: $0) }
        self.location = NameUrl(response: response.location)
        self.names = response.names.map { Names(response: $0) }
        self.pokemonEncounters = response.pokemonEncounters.map { PokemonEncounters(response: $0) }
    }

    init() {
        self.id = ""
        self.name = ""
        self.encounterMethodRates = []
        self.location = NameUrl(name: "", url: "")
        self.names = []
        self.pokemonEncounters = []
    }
}

struct NameUrl {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }

    init(response: NameUrlDTO) {
        self.name = response.name
        self.url = response.url
    }
}

struct Names {
    let name: String
    let language: NameUrl

    init(name: String, language: NameUrl) {
        self.name = name
        self.language = language
    }

    init(response: NamesDTO) {
        self.name = response.name
        self.language = NameUrl(response: response.language)
    }
}

struct EncounterMethodRates {
    let encounterMethod: NameUrl
    let versionDetails: [VersionDetailsEncounter]

    init(encounterMethod: NameUrl, versionDetails: [VersionDetailsEncounter]) {
        self.encounterMethod = encounterMethod
        self.versionDetails = versionDetails
    }

    init(response: EncounterMethodRatesDTO) {
        self.encounterMethod = NameUrl(response: response.encounterMethod)
        self.versionDetails = response.versionDetails.map { VersionDetailsEncounter(response: $0) }
    }
}

struct VersionDetailsEncounter {
    let rate: String
    let version: NameUrl

    init(rate: String, version: NameUrl) {
        self.rate = rate
        self.version = version
    }

    init(response: VersionDetailsDTO) {
        self.rate = String(response.rate)
        self.version = NameUrl(response: response.version)
    }

}

struct PokemonEncounters {
    let pokemon: NameUrl
    let versionDetails: [VersionDetails]

    init(pokemon: NameUrl, versionDetails: [VersionDetails]) {
        self.pokemon = pokemon
        self.versionDetails = versionDetails
    }

    init(response: PokemonEncountersDTO) {
        self.pokemon = NameUrl(response: response.pokemon)
        self.versionDetails = response.versionDetails.map { VersionDetails(response: $0) }
    }
}

struct VersionDetails {
    let encounterDetails: [EncounterDetailArea]
    let maxChance: String
    let version: NameUrl

    init(encounterDetails: [EncounterDetailArea], maxChance: String, version: NameUrl) {
        self.encounterDetails = encounterDetails
        self.maxChance = maxChance
        self.version = version
    }

    init(response: VersionDetail) {
        self.encounterDetails = response.encounterDetails.map {
            EncounterDetailArea(chance: String($0.chance),
                                conditionValues:
                                    $0.conditionValues.map {
                NameUrl(response: $0)
            },
                                maxLevel: String($0.maxLevel),
                                method: NameUrl(response: $0.method),
                                minLevel: String($0.minLevel))
        }

        self.maxChance = String(response.maxChance)
        self.version = NameUrl(response: response.version)
    }
}

struct EncounterDetailArea {
    let chance: String
    let conditionValues: [NameUrl]
    let maxLevel: String
    let method: NameUrl
    let minLevel: String
}

// MARK: - Hashable Extension
extension LocationAreaInfo: Hashable {
    static func == (lhs: LocationAreaInfo, rhs: LocationAreaInfo) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

extension NameUrl: Hashable {}
extension Names: Hashable {}
extension EncounterMethodRates: Hashable {}
extension VersionDetailsEncounter: Hashable {}
extension PokemonEncounters: Hashable {}
extension VersionDetails: Hashable {}
extension EncounterDetailArea: Hashable {}
