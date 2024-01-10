//
//  GetSinglePokemonTests.swift
//  PokeAPITests
//
//  Created by Edgar Guitian Rey on 8/1/24.
//

import XCTest
@testable import PokeAPI

final class GetSinglePokemonTests: XCTestCase {

    func test_execute_sucesfully_returns_single_pokemon() async throws {
        // GIVEN
        let pokemonId: String = "1"
        let namePokemon: String = "Test Pokemon 1"
        let baseExperience: String = "64"
        let height: String = "100"
        let weight: String = "32"
        let locationAreaEncounters = "Test Location Area Encounters"
        let spritesFrontDefault = "Test Front Default"
        let spritesBackDefault = "Test back default"
        let spritesBackShiny = "test back shiny"
        let spritesFrontShiny = "test front shiny"
        let sprites = PokemonSprites(frontDefault: spritesFrontDefault,
                                     backDefault: spritesBackDefault,
                                     backShiny: spritesBackShiny,
                                     frontShiny: spritesFrontShiny)
        let species = PokemonNameUrl(name: "Test pokemon specie name", url: "test pokemon specie url")
        let forms = [PokemonNameUrl(name: "Test pokemon form name", url: "Test pokemon form url")]
        let abilities = [PokemonAbilities(isHidden: false, slot: "test pokemon abilities slot", ability: PokemonNameUrl(name: "test pokemon ability name", url: "test pokemon ability url"))]
        let gameIndices = [PokemonGameIndices(gameIndex: "test game index", version: PokemonNameUrl(name: "test pokemon game indice version name", url: "test pokemon game indice version url"))]
        let heldItems = [PokemonHeldItems(item: PokemonNameUrl(name: "test pokemon held items item name", url: "test pokemon held items item url"), versionDetails: [PokemonHeldItemVersionDetails(rarity: "test pokemon held items version details rarity", version: PokemonNameUrl(name: "test pokemon held items version details version name", url: "test pokemon held items version details version url"))])]
        let moves = [PokemonMoves(move: PokemonNameUrl(name: "test pokemon moves move name", url: "test pokemon moves move url"), versionGroupDetails: [PokemonMoveVersionGroupDetails(levelLearnedAt: "test pokemon moves versiongroupdetails levellearnetat", versionGroup: PokemonNameUrl(name: "test pokemon moves versiongroupdetails versiongroup name", url: "test pokemon moves versiongroupdetails versiongroup url"), moveLearnMethod: PokemonNameUrl(name: "test pokemon moves versiongroupdetails movelearnmethod name", url: "test pokemon moves versiongroupdetails movelearnmethod url"))])]
        let stats = [PokemonStats(baseStat: "test pokemon stats basestat", effort: "test pokemon stats effort", stat: PokemonNameUrl(name: "test pokemon stats stat name", url: "test pokemon stats stat url"))]
        let types = [PokemonTypes(slot: "test pokemon types slot", type: PokemonNameUrl(name: "test pokemon types type name", url: "test pokemon types type url"))]
        let pasttypes = [PokemonPastTypes(generation: PokemonNameUrl(name: "test pokemon pasttypes generation name", url: "test pokemon pasttypes generation url"), types: types)]
        let mockResult = SinglePokemonInfo(id: pokemonId, name: namePokemon, baseExperience: baseExperience, height: height, weight: weight, abilities: abilities, forms: forms, gameIndices: gameIndices, heldItems: heldItems, locationAreaEncounters: locationAreaEncounters, moves: moves, species: species, sprites: sprites, stats: stats, types: types, pastTypes: pasttypes)
        
        let result: Result<SinglePokemonInfo, PokemonDomainError> = .success(mockResult)
        let stub = SinglePokemonRepositoryStub(result: result)
        let sut = GetSinglePokemon(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute(pokemonId: pokemonId)
        
        // THEN
        let capturedSinglePokemon = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedSinglePokemon, mockResult)
        XCTAssertEqual(capturedSinglePokemon.id, pokemonId)
        XCTAssertEqual(capturedSinglePokemon.name, namePokemon)
        XCTAssertEqual(capturedSinglePokemon.baseExperience, baseExperience)
        XCTAssertEqual(capturedSinglePokemon.height, height)
        XCTAssertEqual(capturedSinglePokemon.weight, weight)
        XCTAssertEqual(capturedSinglePokemon.locationAreaEncounters, locationAreaEncounters)
        XCTAssertEqual(capturedSinglePokemon.sprites.frontDefault, spritesFrontDefault)
        XCTAssertEqual(capturedSinglePokemon.sprites.backDefault, spritesBackDefault)
        XCTAssertEqual(capturedSinglePokemon.sprites.backShiny, spritesBackShiny)
        XCTAssertEqual(capturedSinglePokemon.sprites.frontShiny, spritesFrontShiny)

    }
    
    func test_execute_returns_error_when_repository_returns_error() async {
        // GIVEN
        let result: Result<SinglePokemonInfo, PokemonDomainError> = .failure(.generic)
        let stub = SinglePokemonRepositoryStub(result: result)
        let sut = GetSinglePokemon(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute(pokemonId: "1")
        
        // THEN
        XCTAssertEqual(capturedResult, result)
    }

}
