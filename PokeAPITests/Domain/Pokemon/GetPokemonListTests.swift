//
//  GetPokemonListTests.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
@testable import PokeAPI
final class GetPokemonListTests: XCTestCase {

    func test_execute_sucesfully_returns_list_pokemons() async throws {
        // GIVEN
        let mockArray = PokemonListInfo.makeTestable()
        let mockResult = PokemonListInfoResponse(results: mockArray, count: 3, page: 0)

        let result: Result<PokemonListInfoResponse, PokemonDomainError> = .success(mockResult)
        let stub = PokemonListRepositoryStub(result: result)
        let sut = GetPokemonList(repository: stub)

        // WHEN
        let capturedResult = await sut.execute(page: 0)

        // THEN
        let capturedPokemonList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedPokemonList.results.count, 3)
        XCTAssertEqual(capturedPokemonList.results[0], mockArray[0])
        XCTAssertEqual(capturedPokemonList.results[1], mockArray[1])
        XCTAssertEqual(capturedPokemonList.results[2], mockArray[2])

    }

    func test_execute_returns_error_when_repository_returns_error() async {
        // GIVEN
        let result: Result<PokemonListInfoResponse, PokemonDomainError> = .failure(.generic)
        let stub = PokemonListRepositoryStub(result: result)
        let sut = GetPokemonList(repository: stub)

        // WHEN
        let capturedResult = await sut.execute(page: 0)

        // THEN
        XCTAssertEqual(capturedResult, result)
    }

}

private extension PokemonListInfo {
    static func makeTestable() -> [PokemonListInfo] {
        let image1 = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"
        let image2 = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/2.png"
        let image3 = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/3.png"
        return [
            PokemonListInfo(id: "1",
                            name: "Test Pokemon 1",
                            image: URL(string: image1)),
            PokemonListInfo(id: "2",
                            name: "Test Pokemon 2",
                            image: URL(string: image2)),
            PokemonListInfo(id: "3",
                            name: "Test Pokemon 3",
                            image: URL(string: image3))
        ]
    }
}
