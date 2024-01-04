//
//  PokemonDomainErrorMapper.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class PokemonDomainErrorMapper {
    func map(error: HTTPClientError?) -> PokemonDomainError {
        guard error == .tooManyRequests else {
            return .generic
        }

        return .tooManyRequests
    }
}
