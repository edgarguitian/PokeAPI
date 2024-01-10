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

private extension LocationAreaDTO {
    static func makeLocationArea() -> LocationAreaDTO {
        return LocationAreaDTO(id: 1,
                               name: "test location area name",
                               encounterMethodRates: [EncounterMethodRatesDTO(encounterMethod: NameUrlDTO(name: "test locationarea encountermethod name", url: "test locationarea encountermethod url"), versionDetails: [VersionDetailsDTO(rate: 1, version: NameUrlDTO(name: "testlocationarea versiondetails version name", url: "testlocationarea versiondetails version url"))])],
                               location: NameUrlDTO(name: "test locationarea location name", url:  "test locationarea location url"),
                               names: [NamesDTO(name: "test locationarea names name", language: NameUrlDTO(name: "test locationarea names language name", url: "test locationarea names language url"))],
                               pokemonEncounters: [PokemonEncountersDTO(pokemon: NameUrlDTO(name: "test locationarea pokemonencounters pokemon name", url: "test locationarea pokemonencounters pokemon url"), versionDetails: [VersionDetail(encounterDetails: [EncounterDetail(chance: 2, conditionValues: [NameUrlDTO(name: "test locationarea conditionvalues name", url: "test locationarea conditionvalues name")], maxLevel: 3, method: NameUrlDTO(name: "testlocationarea method name", url: "testlocationarea method url"), minLevel: 4)], maxChance: 5, version: NameUrlDTO(name: "test locationarea version name", url: "test locationarea version url"))])]
        )
    }
}

private extension LocationAreaInfo {
    static func makeLocationAreaInfo() -> LocationAreaInfo {
        return LocationAreaInfo(id: "1",
                                name: "test location area name",
                                encounterMethodRates: [EncounterMethodRates(
                                    encounterMethod: NameUrl(name: "test locationarea encountermethod name",
                                                             url: "test locationarea encountermethod url"),
                                    versionDetails: [
                                        VersionDetailsEncounter(rate: "1",
                                                                version: NameUrl(name: "testlocationarea versiondetails version name",
                                                                                 url: "testlocationarea versiondetails version url"))
                                    ])],
                                location: NameUrl(name: "test locationarea location name", url:  "test locationarea location url"),
                                names: [Names(name: "test locationarea names name",
                                              language: NameUrl(name: "test locationarea names language name",
                                                                url: "test locationarea names language url"))],
                                pokemonEncounters: [PokemonEncounters(
                                    pokemon: NameUrl(name: "test locationarea pokemonencounters pokemon name",
                                                     url: "test locationarea pokemonencounters pokemon url"),
                                    versionDetails: [
                                        VersionDetails(
                                            encounterDetails: [EncounterDetailArea(chance: "2",
                                                                                   conditionValues: [NameUrl(name: "test locationarea conditionvalues name",
                                                                                                             url: "test locationarea conditionvalues name")],
                                                                                   maxLevel: "3",
                                                                                   method: NameUrl(name: "testlocationarea method name",
                                                                                                   url: "testlocationarea method url"),
                                                                                   minLevel: "4")],
                                            maxChance: "5",
                                            version: NameUrl(name: "test locationarea version name",
                                                             url: "test locationarea version url")
                                        )
                                    ])
                                ])
    }
}
