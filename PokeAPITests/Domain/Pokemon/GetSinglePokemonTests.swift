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
        let mockResult = SinglePokemonInfo.makeTestable()

        let result: Result<SinglePokemonInfo, PokemonDomainError> = .success(mockResult)
        let stub = SinglePokemonRepositoryStub(result: result)
        let sut = GetSinglePokemon(repository: stub)

        // WHEN
        let capturedResult = await sut.execute(pokemonId: pokemonId)

        // THEN
        let capturedSinglePokemon = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedSinglePokemon, mockResult)
        XCTAssertEqual(capturedSinglePokemon.id, pokemonId)
        XCTAssertEqual(capturedSinglePokemon.name, "Test Pokemon 1")
        XCTAssertEqual(capturedSinglePokemon.baseExperience, "64")
        XCTAssertEqual(capturedSinglePokemon.height, "100")
        XCTAssertEqual(capturedSinglePokemon.weight, "32")
        XCTAssertEqual(capturedSinglePokemon.locationAreaEncounters, "Test Location Area Encounters")
        XCTAssertEqual(capturedSinglePokemon.sprites.frontDefault, "Test Front Default")
        XCTAssertEqual(capturedSinglePokemon.sprites.backDefault, "Test back default")
        XCTAssertEqual(capturedSinglePokemon.sprites.backShiny, "test back shiny")
        XCTAssertEqual(capturedSinglePokemon.sprites.frontShiny, "test front shiny")

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

// Extensión para PokemonSprites
private extension PokemonSprites {
    static func makeTestable() -> PokemonSprites {
        let locationAreaEncounters = "Test Location Area Encounters"
        let spritesFrontDefault = "Test Front Default"
        let spritesBackDefault = "Test back default"
        let spritesBackShiny = "test back shiny"
        let spritesFrontShiny = "test front shiny"
        let sprites = PokemonSprites(frontDefault: spritesFrontDefault,
                                     backDefault: spritesBackDefault,
                                     backShiny: spritesBackShiny,
                                     frontShiny: spritesFrontShiny)
        return sprites
    }
}

private extension PokemonNameUrl {
    static func makeTestable() -> PokemonNameUrl {
        return PokemonNameUrl(name: "Test Pokemon Name", url: "Test Pokemon Url")
    }
}

private extension PokemonAbilities {
    static func makeTestable() -> PokemonAbilities {
        let abilities = PokemonAbilities(isHidden: false,
                                          slot: "test pokemon abilities slot",
                                          ability: PokemonNameUrl.makeTestable())
        return abilities
    }
}

private extension PokemonGameIndices {
    static func makeTestable() -> PokemonGameIndices {
        let gameIndices = PokemonGameIndices(gameIndex: "test game index",
                                              version: PokemonNameUrl.makeTestable())
        return gameIndices
    }
}

private extension PokemonHeldItemVersionDetails {
    static func makeTestable() -> PokemonHeldItemVersionDetails {
        return PokemonHeldItemVersionDetails(rarity: "test pokemon held items version details rarity",
                                             version: PokemonNameUrl.makeTestable())
    }
}

private extension PokemonHeldItems {
    static func makeTestable() -> PokemonHeldItems {
        return PokemonHeldItems(item: PokemonNameUrl.makeTestable(),
                                versionDetails: [PokemonHeldItemVersionDetails.makeTestable()])
    }
}

private extension PokemonMoveVersionGroupDetails {
    static func makeTestable() -> PokemonMoveVersionGroupDetails {
        return PokemonMoveVersionGroupDetails(levelLearnedAt: "test pokemon moves versiongroupdetails levellearnetat",
                                              versionGroup: PokemonNameUrl.makeTestable(),
                                              moveLearnMethod: PokemonNameUrl.makeTestable())
    }
}

private extension PokemonMoves {
    static func makeTestable() -> PokemonMoves {
        return PokemonMoves(move: PokemonNameUrl(name: "test pokemon moves move name",
                                                 url: "test pokemon moves move url"),
                            versionGroupDetails: [PokemonMoveVersionGroupDetails.makeTestable()])
    }
}

private extension PokemonStats {
    static func makeTestable() -> PokemonStats {
        return PokemonStats(baseStat: "test pokemon stats basestat",
                            effort: "test pokemon stats effort",
                            stat: PokemonNameUrl.makeTestable())
    }
}

private extension PokemonTypes {
    static func makeTestable() -> PokemonTypes {
        return PokemonTypes(slot: "test pokemon types slot",
                            type: PokemonNameUrl.makeTestable())
    }
}

private extension PokemonPastTypes {
    static func makeTestable() -> PokemonPastTypes {
        return PokemonPastTypes(generation: PokemonNameUrl.makeTestable(),
                                types: [PokemonTypes.makeTestable()])
    }
}

private extension SinglePokemonInfo {
    static func makeTestable() -> SinglePokemonInfo {
        let pokemonId: String = "1"
        let namePokemon: String = "Test Pokemon 1"
        let baseExperience: String = "64"
        let height: String = "100"
        let weight: String = "32"
        let locationAreaEncounters = "Test Location Area Encounters"

        return SinglePokemonInfo(id: pokemonId,
                                 name: namePokemon,
                                 baseExperience: baseExperience,
                                 height: height,
                                 weight: weight,
                                 abilities: [PokemonAbilities.makeTestable()],
                                 forms: [PokemonNameUrl.makeTestable()],
                                 gameIndices: [PokemonGameIndices.makeTestable()],
                                 heldItems: [PokemonHeldItems.makeTestable()],
                                 locationAreaEncounters: locationAreaEncounters,
                                 moves: [PokemonMoves.makeTestable()],
                                 species: PokemonNameUrl.makeTestable(),
                                 sprites: PokemonSprites.makeTestable(),
                                 stats: [PokemonStats.makeTestable()],
                                 types: [PokemonTypes.makeTestable()],
                                 pastTypes: [PokemonPastTypes.makeTestable()])
    }
}
