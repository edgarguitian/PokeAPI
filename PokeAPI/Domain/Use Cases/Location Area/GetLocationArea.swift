//
//  GetLocationArea.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import Foundation

class GetLocationArea: GetLocationAreaType {
    private let repository: LocationAreaRepositoryType
    
    init(repository: LocationAreaRepositoryType) {
        self.repository = repository
    }
    
    func execute(url: String) async -> Result<LocationAreaInfo, PokemonDomainError> {
        let result = await repository.getLocationArea(url: url)
        
        guard let locationAreaResult = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }

            return .failure(error)
        }
        
        return .success(locationAreaResult)
    }
}
