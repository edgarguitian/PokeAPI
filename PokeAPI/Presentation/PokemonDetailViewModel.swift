//
//  PokemonDetailViewModel.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    @Published var pokemonDetailInfo: SinglePokemonInfo
    @Published var locationDetailInfo: SingleLocationInfo

    let pokemonId: String
    private let getSinglePokemon: GetSinglePokemonType
    private let getSingleLocation: GetSingleLocationType
    private let errorMapper: PokemonPresentableErrorMapper

    init(pokemonId: String,
         getSinglePokemon: GetSinglePokemonType,
         getSingleLocation: GetSingleLocationType,
         errorMapper: PokemonPresentableErrorMapper) {
        self.pokemonId = pokemonId
        self.getSinglePokemon = getSinglePokemon
        self.getSingleLocation = getSingleLocation
        self.errorMapper = errorMapper
        self.pokemonDetailInfo = SinglePokemonInfo()
        self.pokemonDetailInfo = SinglePokemonInfo()
        self.locationDetailInfo = SingleLocationInfo()
    }

    func onAppear() {
        showLoadingSpinner = true
        Task {
            let result = await getSinglePokemon.execute(pokemonId: pokemonId)
            handleResultPokemon(result)
        }
    }

    func handleResultPokemon(_ result: Result<SinglePokemonInfo, PokemonDomainError>) {
        guard case .success(let pokemonInfo) = result else {
            handleError(error: result.failureValue as? PokemonDomainError)
            return
        }

        Task {
            let result = await getSingleLocation.execute(url: pokemonInfo.locationAreaEncounters)
            handleResultLocation(result)
        }

        Task { @MainActor in
            self.pokemonDetailInfo = pokemonInfo
        }
    }

    func handleResultLocation(_ result: Result<SingleLocationInfo, PokemonDomainError>) {
        guard case .success(let locationInfo) = result else {
            showLoadingSpinner = false
            return
        }

        Task { @MainActor in
            showLoadingSpinner = false
            self.locationDetailInfo = locationInfo
        }
    }

    private func handleError(error: PokemonDomainError?) {
        Task { @MainActor in
            showLoadingSpinner = false
            showErrorMessage = errorMapper.map(error: error)
        }
    }
}
