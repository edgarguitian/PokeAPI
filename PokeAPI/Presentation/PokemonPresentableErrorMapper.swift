//
//  PokemonPresentableErrorMapper.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import Foundation

class PokemonPresentableErrorMapper {
    func map(error: PokemonDomainError?) -> String {
        guard error == .tooManyRequests else {
            return "Something went wrong"
        }

        return "You have exceeded the limit. Try again later"
    }
}
