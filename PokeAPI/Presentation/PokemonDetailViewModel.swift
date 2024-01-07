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
    @Published var isInfoSectionExpanded: Bool = false
    @Published var isAbilitiesSectionExpanded: Bool = false
    @Published var isFormsSectionExpanded: Bool = false
    @Published var isGameIndicesSectionExpanded: Bool = false
    @Published var isHeldItemsSectionExpanded: Bool = false
    @Published var isMovesSectionExpanded: Bool = false
    @Published var isStatsSectionExpanded: Bool = false
    @Published var isTypesSectionExpanded: Bool = false
    @Published var isPastTypesSectionExpanded: Bool = false
    
    let pokemonId: String
    private let getSinglePokemon: GetSinglePokemonType
    private let errorMapper: PokemonPresentableErrorMapper

    init(pokemonId: String, getSinglePokemon: GetSinglePokemonType, errorMapper: PokemonPresentableErrorMapper) {
        self.pokemonId = pokemonId
        self.getSinglePokemon = getSinglePokemon
        self.errorMapper = errorMapper
        self.pokemonDetailInfo = SinglePokemonInfo()
    }
    
    func onAppear() {
        showLoadingSpinner = true
        Task {
            let result = await getSinglePokemon.execute(pokemonId: pokemonId)
            handleResult(result)
        }
    }
    
    func handleResult(_ result: Result<SinglePokemonInfo, PokemonDomainError>) {
        guard case .success(let pokemonInfo) = result else {
            handleError(error: result.failureValue as? PokemonDomainError)
            return
        }

        Task { @MainActor in
            showLoadingSpinner = false
            self.pokemonDetailInfo = pokemonInfo
        }
    }
    
    private func handleError(error: PokemonDomainError?) {
        Task { @MainActor in
            showLoadingSpinner = false
            showErrorMessage = errorMapper.map(error: error)
        }
    }
}
