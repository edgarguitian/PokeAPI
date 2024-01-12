//
//  LocationAreaRepositoryTests.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
@testable import PokeAPI

final class LocationAreaRepositoryTests: XCTestCase {

    func test_getLocationArea_returns_success_with_one_item_when_there_is_one_location() async throws {
        // GIVEN
        let apiDataSource = APILocationAreaDataSourceStub(locationList: .success(LocationAreaDTO.makeLocationArea()))
        let sut = LocationAreaRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper())

        // WHEN
        let result = await sut.getLocationArea(url: "https://pokeapi.co/api/v2/location-area/1/")

        // THEN
        let singleLocation = try XCTUnwrap(result.get())
        XCTAssertEqual(singleLocation, LocationAreaInfo.makeLocationAreaInfo())

    }

    func test_getLocationArea_returns_failure_when_apiDataSource_fails_ongetLocationArea() async throws {
        // GIVEN
        let apiDataSource = APILocationAreaDataSourceStub(locationList: .failure(.clientError))
        let sut = LocationAreaRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper())

        // WHEN
        let result = await sut.getLocationArea(url: "https://pokeapi.co/api/v2/location-area/1/")

        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, PokemonDomainError.generic)
    }

}

private extension NameUrlDTO {
    static func makeTestable() -> NameUrlDTO {
        return NameUrlDTO(name: "Test Name", url: "Test URL")
    }
}

private extension EncounterDetail {
    static func makeTestable() -> EncounterDetail {
        return EncounterDetail(chance: 2,
                               conditionValues: [NameUrlDTO.makeTestable()],
                               maxLevel: 3,
                                                method: NameUrlDTO.makeTestable(),
                                                minLevel: 4)
    }
}

private extension VersionDetail {
    static func makeTestable() -> VersionDetail {
        return VersionDetail(encounterDetails: [EncounterDetail.makeTestable()],
                               maxChance: 5,
                               version: NameUrlDTO.makeTestable())
    }
}

private extension PokemonEncountersDTO {
    static func makeTestable() -> PokemonEncountersDTO {
        return PokemonEncountersDTO(pokemon: NameUrlDTO.makeTestable(),
                                    versionDetails: [VersionDetail.makeTestable()])
    }
}

private extension VersionDetailsDTO {
    static func makeTestable() -> VersionDetailsDTO {
        return VersionDetailsDTO(rate: 1,
                                 version: NameUrlDTO.makeTestable())
    }
}

private extension EncounterMethodRatesDTO {
    static func makeTestable() -> EncounterMethodRatesDTO {
        return EncounterMethodRatesDTO(encounterMethod: NameUrlDTO.makeTestable(),
                                       versionDetails: [VersionDetailsDTO.makeTestable()])
    }

}

private extension LocationAreaDTO {
    static func makeLocationArea() -> LocationAreaDTO {
        return LocationAreaDTO(id: 1,
                               name: "test location area name",
                               encounterMethodRates: [EncounterMethodRatesDTO.makeTestable()],
                               location: NameUrlDTO.makeTestable(),
                               names: [NamesDTO(name: "test locationarea names name",
                                                language: NameUrlDTO.makeTestable())],
                               pokemonEncounters: [PokemonEncountersDTO.makeTestable()]
        )
    }
}

private extension NameUrl {
    static func makeTestable() -> NameUrl {
        return NameUrl(name: "Test Name", url: "Test URL")
    }
}

private extension EncounterDetailArea {
    static func makeTestable() -> EncounterDetailArea {
        return EncounterDetailArea(chance: "test l",
                                   conditionValues: [NameUrl.makeTestable()],
                                   maxLevel: "test i",
                                   method: NameUrl(name: "test j",
                                                   url: "test k"),
                                   minLevel: "test h")
    }
}

private extension LocationAreaInfo {
    static func makeLocationAreaInfo() -> LocationAreaInfo {
        return LocationAreaInfo(id: "1",
                                name: "test location area name",
                                encounterMethodRates: [EncounterMethodRates(
                                    encounterMethod: NameUrl.makeTestable(),
                                    versionDetails: [
                                        VersionDetailsEncounter(rate: "1",
                                                                version: NameUrl.makeTestable())
                                    ])],
                                location: NameUrl(name: "test locationarea location name",
                                                  url: "test locationarea location url"),
                                names: [Names(name: "test locationarea names name",
                                              language: NameUrl.makeTestable())],
                                pokemonEncounters: [PokemonEncounters(
                                    pokemon: NameUrl.makeTestable(),
                                    versionDetails: [
                                        VersionDetails(
                                            encounterDetails: [EncounterDetailArea.makeTestable()],
                                            maxChance: "5",
                                            version: NameUrl(name: "test locationarea version name",
                                                             url: "test locationarea version url")
                                        )
                                    ])
                                ])
    }
}
