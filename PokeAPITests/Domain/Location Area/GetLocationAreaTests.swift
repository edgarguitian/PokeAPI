//
//  GetLocationAreaTests.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
@testable import PokeAPI

final class GetLocationAreaTests: XCTestCase {

    func test_execute_sucesfully_returns_location_area() async throws {
        // GIVEN
        let locationAreaInfoID = "test location area info id"
        let locationAreaInfoName = "test location area info name"

        let mockResult = LocationAreaInfo.makeTestable()

        let result: Result<LocationAreaInfo, PokemonDomainError> = .success(mockResult)
        let stub = LocationAreaRepositoryStub(result: result)
        let sut = GetLocationArea(repository: stub)

        // WHEN
        let capturedResult = await sut.execute(url: "https://pokeapi.co/api/v2/location-area/296/")

        // THEN
        let capturedLocationArea = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedLocationArea, mockResult)
        XCTAssertEqual(capturedLocationArea.id, locationAreaInfoID)
        XCTAssertEqual(capturedLocationArea.name, locationAreaInfoName)
        XCTAssertEqual(capturedLocationArea.location.name, "Test Name")

    }

    func test_execute_returns_error_when_repository_returns_error() async {
        // GIVEN
        let result: Result<LocationAreaInfo, PokemonDomainError> = .failure(.generic)
        let stub = LocationAreaRepositoryStub(result: result)
        let sut = GetLocationArea(repository: stub)

        // WHEN
        let capturedResult = await sut.execute(url: "https://pokeapi.co/api/v2/location-area/296/")

        // THEN
        XCTAssertEqual(capturedResult, result)
    }

}

private extension NameUrl {
    static func makeTestable() -> NameUrl {
        return NameUrl(name: "Test Name", url: "Test URL")
    }
}

private extension Names {
    static func makeTestable() -> Names {
        return Names(name: "test location area info names name",
                     language: NameUrl.makeTestable())
    }
}

private extension VersionDetailsEncounter {
    static func makeTestable() -> VersionDetailsEncounter {
        return VersionDetailsEncounter(rate: "test rate versiondetailencounter",
                                       version: NameUrl.makeTestable())
    }
}

private extension EncounterMethodRates {
    static func makeTestable() -> EncounterMethodRates {
        return EncounterMethodRates(encounterMethod: NameUrl.makeTestable(),
                                    versionDetails: [VersionDetailsEncounter.makeTestable()])
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

private extension VersionDetails {
    static func makeTestable() -> VersionDetails {
        return VersionDetails(encounterDetails: [EncounterDetailArea.makeTestable()],
                              maxChance: "test aa",
                              version: NameUrl.makeTestable())
    }
}

private extension PokemonEncounters {
    static func makeTestable() -> PokemonEncounters {
        return PokemonEncounters(pokemon: NameUrl(name: "test f",
                                                  url: "test g"),
                                 versionDetails: [VersionDetails.makeTestable()])
    }
}

private extension LocationAreaInfo {
    static func makeTestable() -> LocationAreaInfo {
        let locationAreaInfoID = "test location area info id"
        let locationAreaInfoName = "test location area info name"
        return LocationAreaInfo(id: locationAreaInfoID,
                                name: locationAreaInfoName,
                                encounterMethodRates: [EncounterMethodRates.makeTestable()],
                                location: NameUrl.makeTestable(),
                                names: [Names.makeTestable()],
                                pokemonEncounters: [PokemonEncounters.makeTestable()])
    }
}
