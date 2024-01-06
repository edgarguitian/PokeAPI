//
//  PokemonSpritesDTO.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 5/1/24.
//

import Foundation

struct PokemonSpritesDTO: Decodable {
    let frontDefault: String
    //let backDefault: String?
    //let backShiny: String?
    //let fromShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        //case backDefault = "back_default"
        //case backShiny = "back_shiny"
        //case fromShiny = "front_shiny"
    }
}
