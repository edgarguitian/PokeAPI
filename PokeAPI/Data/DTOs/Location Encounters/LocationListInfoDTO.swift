//
//  LocationListInfoDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

// MARK: - LocationItemInfoDTO
struct LocationItemInfoDTO: Decodable {
    let locationArea: NameUrlDTO
    let versionDetails: [VersionDetail]

    enum CodingKeys: String, CodingKey {
        case locationArea = "location_area"
        case versionDetails = "version_details"
    }
}

// MARK: - VersionDetail
struct VersionDetail: Decodable {
    let encounterDetails: [EncounterDetail]
    let maxChance: Int
    let version: NameUrlDTO

    enum CodingKeys: String, CodingKey {
        case encounterDetails = "encounter_details"
        case maxChance = "max_chance"
        case version
    }
}

// MARK: - EncounterDetail
struct EncounterDetail: Decodable {
    let chance: Int
    let conditionValues: [NameUrlDTO]
    let maxLevel: Int
    let method: NameUrlDTO
    let minLevel: Int

    enum CodingKeys: String, CodingKey {
        case chance
        case conditionValues = "condition_values"
        case maxLevel = "max_level"
        case method
        case minLevel = "min_level"
    }
}

typealias LocationListInfoDTO = [LocationItemInfoDTO]
