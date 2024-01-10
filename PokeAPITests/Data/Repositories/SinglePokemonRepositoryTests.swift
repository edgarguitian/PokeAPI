//
//  SinglePokemonRepositoryTests.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
@testable import PokeAPI

final class SinglePokemonRepositoryTests: XCTestCase {

    func test_getPokemonInfo_return_success() async throws {
        // GIVEN
        let apiDataSource = APISinglePokemonDataSourceStub(pokemonList: .success(PokemonListInfoDTO.makePokemonListInfo()))
        let sut = SinglePokemonRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper())
        
        // WHEN
        let result = await sut.getPokemonInfo(pokemonId: "1")
        
        // THEN
        let singlePokemon = try XCTUnwrap(result.get())
        XCTAssertEqual(singlePokemon, SinglePokemonInfo.makeSinglePokemonInfo())

    }
    
    func test_getPokemonInfo_returns_failure_when_apiDataSource_fails_ongetPokemonInfo() async throws {
        // GIVEN
        let apiDataSource = APISinglePokemonDataSourceStub(pokemonList: .failure(.clientError))
        let sut = SinglePokemonRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper())
        
        // WHEN
        let result = await sut.getPokemonInfo(pokemonId: "1")
        
        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, PokemonDomainError.generic)
    }

}

private extension PokemonListInfoDTO {
    static func makePokemonListInfo() -> PokemonListInfoDTO{
        return PokemonListInfoDTO(id: 1, name: "test name 1", baseExperience: 64, height: 100, weight: 2, abilities: [], forms: [], gameIndices: [], heldItems: [], locationAreaEncounters: "test pokemonListInfoDTO locationareancounters", moves: [], species: NameUrlDTO(name: "test species name", url: "test species url"), sprites: PokemonSpritesDTO(frontDefault: "test pokemonListInfoDTO frontdefault", backDefault: "", backShiny: "", frontShiny: ""), stats: [], types: [], pastTypes: [])
    }
}

private extension SinglePokemonInfo {
    static func makeSinglePokemonInfo() -> SinglePokemonInfo {
        return SinglePokemonInfo(id: "1", name: "test name 1", baseExperience: "64", height: "100", weight: "2", abilities: [], forms: [], gameIndices: [], heldItems: [], locationAreaEncounters: "test pokemonListInfoDTO locationareancounters", moves: [], species: PokemonNameUrl(name: "test species name", url: "test species url"), sprites: PokemonSprites(frontDefault: "test pokemonListInfoDTO frontdefault", backDefault: "", backShiny: "", frontShiny: ""), stats: [], types: [], pastTypes: [])
    }
}
