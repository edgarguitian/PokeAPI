//
//  GetSingleLocationTests.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
@testable import PokeAPI

final class GetSingleLocationTests: XCTestCase {

    func test_execute_sucesfully_returns_single_location() async throws {
        // GIVEN
        let mockArray = [
          NameUrl(name: "Test Location NameURL Name 1", url: "Test Location NameURL URL 1"),
          NameUrl(name: "Test Location NameURL Name 2", url: "Test Location NameURL URL 2"),
          NameUrl(name: "Test Location NameURL Name 3", url: "Test Location NameURL URL 3")
        ]
        let mockResult = SingleLocationInfo(values: mockArray)

        let result: Result<SingleLocationInfo, PokemonDomainError> = .success(mockResult)
        let stub = SingleLocationRepositoryStub(result: result)
        let sut = GetSingleLocation(repository: stub)

        // WHEN
        let capturedResult = await sut.execute(url: "https://pokeapi.co/api/v2/pokemon/1/encounters")

        // THEN
        let capturedSingleLocation = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedSingleLocation.values.count, 3)
        XCTAssertEqual(capturedSingleLocation.values[0], mockArray[0])
        XCTAssertEqual(capturedSingleLocation.values[1], mockArray[1])
        XCTAssertEqual(capturedSingleLocation.values[2], mockArray[2])

    }

    func test_execute_returns_error_when_repository_returns_error() async {
        // GIVEN
        let result: Result<SingleLocationInfo, PokemonDomainError> = .failure(.generic)
        let stub = SingleLocationRepositoryStub(result: result)
        let sut = GetSingleLocation(repository: stub)

        // WHEN
        let capturedResult = await sut.execute(url: "https://pokeapi.co/api/v2/pokemon/1/encounters")

        // THEN
        XCTAssertEqual(capturedResult, result)
    }

}
