//
//  SingleLocationRepositoryTests.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
@testable import PokeAPI

final class SingleLocationRepositoryTests: XCTestCase {

    func test_getLocationInfo_returns_success_with_one_item_when_there_is_one_location() async throws {
        // GIVEN
        let apiDataSource = APISingleLocationDataSourceStub(locationList:
                .success(LocationListInfoDTO.makeLocationListInfo()))
        let sut = SingleLocationRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper())

        // WHEN
        let result = await sut.getLocationInfo(url: "https://pokeapi.co/api/v2/pokemon/35/encounters")

        // THEN
        let singleLocation = try XCTUnwrap(result.get())
        XCTAssertEqual(singleLocation, SingleLocationInfo.makeSingleLocationInfo())

    }

    func test_getLocationInfo_returns_success_with_three_items_when_there_are_three_locations() async throws {
        // GIVEN
        let apiDataSource = APISingleLocationDataSourceStub(locationList:
                .success(LocationListInfoDTO.makeLocationListInfoThree()))
        let sut = SingleLocationRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper())

        // WHEN
        let result = await sut.getLocationInfo(url: "https://pokeapi.co/api/v2/pokemon/35/encounters")

        // THEN
        let singleLocation = try XCTUnwrap(result.get())
        XCTAssertEqual(singleLocation, SingleLocationInfo.makeSingleLocationInfoThree())

    }

    func test_getLocationInfo_returns_failure_when_apiDataSource_fails_ongetLocationInfo() async throws {
        // GIVEN
        let apiDataSource = APISingleLocationDataSourceStub(locationList: .failure(.clientError))
        let sut = SingleLocationRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper())

        // WHEN
        let result = await sut.getLocationInfo(url: "https://pokeapi.co/api/v2/pokemon/35/encounters")

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

private extension LocationListInfoDTO {
    static func makeLocationListInfo() -> [LocationItemInfoDTO] {
        return [LocationItemInfoDTO(locationArea: NameUrlDTO.makeTestable(),
                                    versionDetails: [VersionDetail.makeTestable()])]
    }

    static func makeLocationListInfoThree() -> [LocationItemInfoDTO] {
        return [
            LocationItemInfoDTO(locationArea: NameUrlDTO(name: "test locationArea name 1",
                                                         url: "test locationArea url 1"),
                                versionDetails: [VersionDetail.makeTestable()]),
            LocationItemInfoDTO(locationArea: NameUrlDTO(name: "test locationArea name 2",
                                                         url: "test locationArea url 2"),
                                versionDetails: [VersionDetail.makeTestable()]),
            LocationItemInfoDTO(locationArea: NameUrlDTO(name: "test locationArea name 3",
                                                         url: "test locationArea url 3"),
                                versionDetails: [VersionDetail.makeTestable()])

        ]
    }
}

private extension NameUrl {
    static func makeTestable() -> NameUrl {
        return NameUrl(name: "Test Name", url: "Test URL")
    }
}

private extension SingleLocationInfo {
    static func makeSingleLocationInfo() -> SingleLocationInfo {
        return SingleLocationInfo(values: [NameUrl.makeTestable()])
    }

    static func makeSingleLocationInfoThree() -> SingleLocationInfo {
        return SingleLocationInfo(values: [
            NameUrl(name: "test locationArea name 1",
                    url: "test locationArea url 1"),
            NameUrl(name: "test locationArea name 2",
                    url: "test locationArea url 2"),
            NameUrl(name: "test locationArea name 3",
                    url: "test locationArea url 3")
        ])
    }
}
