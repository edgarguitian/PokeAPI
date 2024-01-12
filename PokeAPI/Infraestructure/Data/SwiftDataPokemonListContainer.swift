//
//  SwiftDataPokemonListContainer.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 11/1/24.
//

import Foundation
import SwiftData

class SwiftDataPokemonListContainer: SwiftDataPokemonListContainerType {
    static let shared = SwiftDataPokemonListContainer()

    @MainActor var container: ModelContainer = setupContainer(inMemory: Constants.shared.saveInMemory)

    private init() {

    }

    @MainActor
    static func setupContainer(inMemory: Bool) -> ModelContainer {
        do {
            let container = try ModelContainer(for: PokemonListData.self,
                                               configurations: ModelConfiguration(isStoredInMemoryOnly: inMemory))

            container.mainContext.autosaveEnabled = true
            return container
        } catch {
            print("Error \(error.localizedDescription)")
            fatalError()
        }
    }

    @MainActor
    func fetchPokemons() async -> [PokemonListData] {
        let descriptor = FetchDescriptor<PokemonListData>()

        do {
            let pokemons = try container.mainContext.fetch(descriptor)
            return pokemons
        } catch {
            print("Error al realizar la consulta: \(error)")
            return []
        }
    }

    @MainActor
    func fetchPokemons(page: Int) -> [PokemonListData] {
        let descriptor = FetchDescriptor<PokemonListData>(predicate: #Predicate { pokemon in
            pokemon.page == page
        })
        do {
            let pokemons = try container.mainContext.fetch(descriptor)
            return pokemons
        } catch {
            print("Error al realizar la consulta: \(error)")
            return []
        }
    }

    @MainActor
    func insert(pokemonsDataList: PokemonListData) async {
        container.mainContext.insert(pokemonsDataList)
    }

    @MainActor
    func saveData() async {
        do {
            try container.mainContext.save()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }

}

extension SwiftDataPokemonListContainer {
    @MainActor
    func clearCache() {
        let descriptor = FetchDescriptor<PokemonListData>()

        do {
            let pokemons = try container.mainContext.fetch(descriptor)
            for pokemon in pokemons {
                container.mainContext.delete(pokemon)
            }
            try container.mainContext.save()
        } catch {
            print("Error al limpiar la caché: \(error)")
        }
    }
}
