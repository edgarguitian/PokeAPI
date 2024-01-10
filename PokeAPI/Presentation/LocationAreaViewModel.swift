//
//  LocationAreaViewModel.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

class LocationAreaViewModel: ObservableObject {
    @Published var showLoadingSpinner: Bool = false
    @Published var showErrorMessage: String?
    @Published var locationAreaInfo: LocationAreaInfo
    let url: String
    private let getLocationArea: GetLocationAreaType
    private let errorMapper: PokemonPresentableErrorMapper

    init(url: String, getLocationArea: GetLocationAreaType, errorMapper: PokemonPresentableErrorMapper) {
        self.url = url
        self.getLocationArea = getLocationArea
        self.errorMapper = errorMapper
        self.locationAreaInfo = LocationAreaInfo()
    }

    func onAppear() {
        showLoadingSpinner = true
        Task {
            let result = await getLocationArea.execute(url: url)
            handleResult(result)
        }
    }

    func handleResult(_ result: Result<LocationAreaInfo, PokemonDomainError>) {
        guard case .success(let locationInfo) = result else {
            handleError(error: result.failureValue as? PokemonDomainError)
            return
        }

        Task { @MainActor in
            showLoadingSpinner = false
            self.locationAreaInfo = locationInfo
        }
    }

    private func handleError(error: PokemonDomainError?) {
        Task { @MainActor in
            showLoadingSpinner = false
            showErrorMessage = errorMapper.map(error: error)
        }
    }
}
