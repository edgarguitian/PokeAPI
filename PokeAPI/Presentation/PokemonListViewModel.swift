//
//  PokemonListViewModel.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

final class PokemonListViewModel: ObservableObject {
    private let getPokemonList: GetPokemonListType
    private let errorMapper: PokemonPresentableErrorMapper
    @Published var showLoadingSpinner: Bool = false
    @Published var showLoadingNextPage: Bool = false
    @Published var showErrorMessage: String?
    @Published var filteredPokemonList: [PokemonListPresentableItem] = []
    var pokemonList: [PokemonListPresentableItem] = []
    var currentPage: Int = 0

    init(getPokemonList: GetPokemonListType, errorMapper: PokemonPresentableErrorMapper) {
        self.getPokemonList = getPokemonList
        self.errorMapper = errorMapper
    }

    func onAppear(isFirstLoad: Bool) {
        if isFirstLoad {
            let uiTestErrorHandling = ProcessInfo.processInfo.arguments.contains("UITestErrorHandling")
            showErrorMessage = uiTestErrorHandling ? "Error al cargar la vista en UITest" : nil
            showLoadingSpinner = true
        } else {
            showLoadingNextPage = true
        }
        Task {
            let result = await getPokemonList.execute(page: currentPage)
            handleResult(result, isFirstLoad: isFirstLoad)
        }
    }

    func search(searchPokemon: String) {
        if searchPokemon.isEmpty {
            filteredPokemonList = pokemonList
        } else {
            filteredPokemonList = pokemonList.filter { pokemon in
                let lowercasedSearch = searchPokemon.lowercased()
                return pokemon.name.lowercased().contains(lowercasedSearch) || pokemon.id.contains(lowercasedSearch)
            }
        }
    }

    func handleResult(_ result: Result<PokemonListInfoResponse, PokemonDomainError>, isFirstLoad: Bool) {
        guard case .success(let pokemonListInfo) = result else {
            handleError(error: result.failureValue as? PokemonDomainError)
            return
        }

        let pokemonsPresentable = pokemonListInfo.results.map {
            PokemonListPresentableItem(id: String($0.id), name: $0.name.capitalizeFirstLetter(), image: $0.image!)
        }

        Task { @MainActor in
            showLoadingSpinner = false
            if isFirstLoad {
                self.pokemonList = pokemonsPresentable
                self.filteredPokemonList = pokemonsPresentable
            } else {
                self.pokemonList.append(contentsOf: pokemonsPresentable)
                self.filteredPokemonList.append(contentsOf: pokemonsPresentable)
                showLoadingNextPage = false
            }
            if filteredPokemonList.count < pokemonListInfo.count {
                self.currentPage += 1
            }
        }
    }

    private func handleError(error: PokemonDomainError?) {
        Task { @MainActor in
            showLoadingSpinner = false
            showErrorMessage = errorMapper.map(error: error)
        }
    }

}
