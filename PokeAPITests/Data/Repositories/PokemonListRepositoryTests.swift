//
//  PokemonListRepositoryTests.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
@testable import PokeAPI

final class PokemonListRepositoryTests: XCTestCase {
    
    func test_getPokemonList_returns_success_with_one_item_when_there_is_one_pokemon() async throws {
        // GIVEN
        let apiDataSource = APIPokemonListDataSourceStub(pokemonList: .success(PokemonListResponseDTO.makePokemonListResponse()), pokemonListInfo: .success(PokemonListInfoDTO.makePokemonListInfo()))
        let sut = PokemonListRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper(), domainMapper: PokemonListDomainMapper())
        
        // WHEN
        let result = await sut.getPokemonList()
       
        // THEN
        let pokemonList = try XCTUnwrap(result.get())
        XCTAssertEqual(pokemonList, PokemonListInfoResponse.makePokemonListInfoResponse())
    }
    
    func test_getPokemonList_returns_failure_when_apiDataSource_fails_ongetPokemonList() async throws {
        // GIVEN
        let apiDataSource = APIPokemonListDataSourceStub(pokemonList: .failure(.clientError), pokemonListInfo: .success(PokemonListInfoDTO.makePokemonListInfo()))
        let sut = PokemonListRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper(), domainMapper: PokemonListDomainMapper())
        
        // WHEN
        let result = await sut.getPokemonList()
       
        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, PokemonDomainError.generic)
    }
    
    func test_getPokemonList_returns_failure_when_apiDataSource_fails_ongetPokemonListInfo() async throws {
        // GIVEN
        let apiDataSource = APIPokemonListDataSourceStub(pokemonList: .success(PokemonListResponseDTO.makePokemonListResponse()), pokemonListInfo: .failure(.clientError))
        let sut = PokemonListRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper(), domainMapper: PokemonListDomainMapper())
        
        // WHEN
        let result = await sut.getPokemonList()
       
        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, PokemonDomainError.generic)
    }
    
    func test_getPokemonList_returns_success_with_three_items_when_there_are_three_pokemons() async throws {
        // GIVEN
        let apiDataSource = APIPokemonListDataSourceStub(pokemonList: .success(PokemonListResponseDTO.makePokemonListResponseThree()), pokemonListInfo: .success(PokemonListInfoDTO.makePokemonListInfo()))
        let sut = PokemonListRepository(apiDataSource: apiDataSource, errorMapper: PokemonDomainErrorMapper(), domainMapper: PokemonListDomainMapper())
        
        // WHEN
        let result = await sut.getPokemonList()
       
        // THEN
        let pokemonList = try XCTUnwrap(result.get())
        XCTAssertEqual(pokemonList, PokemonListInfoResponse.makePokemonListInfoResponseThree())
        
    }
    
}

extension PokemonListResponseDTO {
    static func makePokemonListResponse() -> PokemonListResponseDTO {
        let results = [
            NameUrlDTO(name: "test nameurl name 1", url: "https://pokeapi.co/api/v2/pokemon/1/")
        ]
        return PokemonListResponseDTO(results: results)
    }
    
    static func makePokemonListResponseThree() -> PokemonListResponseDTO {
        let results = [
            NameUrlDTO(name: "test nameurl name 1", url: "https://pokeapi.co/api/v2/pokemon/1/"),
            NameUrlDTO(name: "test nameurl name 2", url: "https://pokeapi.co/api/v2/pokemon/2/"),
            NameUrlDTO(name: "test nameurl name 3", url: "https://pokeapi.co/api/v2/pokemon/3/")
        ]
        return PokemonListResponseDTO(results: results)
    }
}

private extension PokemonListInfoDTO {
    static func makePokemonListInfo() -> PokemonListInfoDTO {
        return PokemonListInfoDTO(id: 1, name: "test name 1", baseExperience: 64, height: 100, weight: 2, abilities: [], forms: [], gameIndices: [], heldItems: [], locationAreaEncounters: "test pokemonListInfoDTO locationareancounters", moves: [], species: NameUrlDTO(name: "test species name", url: "test species url"), sprites: PokemonSpritesDTO(frontDefault: "test pokemonListInfoDTO frontdefault", backDefault: "", backShiny: "", frontShiny: ""), stats: [], types: [], pastTypes: [])
    }
}

private extension PokemonListInfoResponse {
    static func makePokemonListInfoResponse() -> PokemonListInfoResponse {
        let results = [
            PokemonListInfo(id: "1", name: "test name 1", image: URL(string: "test pokemonListInfoDTO frontdefault"))
        ]
        return PokemonListInfoResponse(results: results)
    }
    
    static func makePokemonListInfoResponseThree() -> PokemonListInfoResponse {
        let results = [
            PokemonListInfo(id: "1", name: "test name 1", image: URL(string: "test pokemonListInfoDTO frontdefault")),
            PokemonListInfo(id: "1", name: "test name 1", image: URL(string: "test pokemonListInfoDTO frontdefault")),
            PokemonListInfo(id: "1", name: "test name 1", image: URL(string: "test pokemonListInfoDTO frontdefault"))
        ]
        return PokemonListInfoResponse(results: results)
    }
}
