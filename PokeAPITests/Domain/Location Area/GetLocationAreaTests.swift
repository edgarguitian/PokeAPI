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
        let locationAreaInfoLocation = NameUrl(name: "test location area info location name", url: "test location area info location url")
        let locationAreaInfoNames = [Names(name: "test location area info names name", language: NameUrl(name: "test location area info names language name", url: "test location area info names language url"))]
        let locationAreaInfoEncounters = [EncounterMethodRates(encounterMethod: NameUrl(name: "test a", url: "test b"), versionDetails: [VersionDetailsEncounter(rate: "test c", version: NameUrl(name: "test d", url: "test e"))])]
        let locationAreaInfoPokemonEncounters = [PokemonEncounters(pokemon: NameUrl(name: "test f", url: "test g"), versionDetails: [VersionDetails(encounterDetails: [EncounterDetailArea(chance: "test l", conditionValues: [NameUrl(name: "test m", url: "test n")], maxLevel: "test i", method: NameUrl(name: "test j", url: "test k"), minLevel: "test h")], maxChance: "test aa", version: NameUrl(name: "test bb", url: "test cc"))])]
        let mockResult = LocationAreaInfo(id: locationAreaInfoID, name: locationAreaInfoName, encounterMethodRates: locationAreaInfoEncounters, location: locationAreaInfoLocation, names: locationAreaInfoNames, pokemonEncounters: locationAreaInfoPokemonEncounters)
        
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
        XCTAssertEqual(capturedLocationArea.location.name, locationAreaInfoLocation.name)



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
