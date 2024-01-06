//
//  SinglePokemonInfo.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

class SinglePokemonInfo {
    let id: String
    let name: String
    let baseExperience: String
    let height: String
    let weight: String
    let abilities: [PokemonAbilities]
    let forms: [PokemonNameUrl]
    let gameIndices: [PokemonGameIndices]
    let heldItems: [PokemonHeldItems]
    let locationAreaEncounters: String
    let moves: [PokemonMoves]
    let species: PokemonNameUrl
    let sprites: PokemonSprites
    let stats: [PokemonStats]
    let types: [PokemonTypes]
    let pastTypes: [PokemonPastTypes]
    
    init() {
        self.id = ""
        self.name = ""
        self.baseExperience = ""
        self.height = ""
        self.weight = ""
        self.abilities = []
        self.forms = []
        self.gameIndices = []
        self.heldItems = []
        self.locationAreaEncounters = ""
        self.moves = []
        self.species = PokemonNameUrl(name: "", url: "")
        self.sprites = PokemonSprites(frontDefault: "", backDefault: "", backShiny: "", frontShiny: "")
        self.stats = []
        self.types = []
        self.pastTypes = []
    }
    
    init(id: String, name: String, baseExperience: String, height: String, weight: String, abilities: [PokemonAbilities], forms: [PokemonNameUrl], gameIndices: [PokemonGameIndices], heldItems: [PokemonHeldItems], locationAreaEncounters: String, moves: [PokemonMoves], species: PokemonNameUrl, sprites: PokemonSprites, stats: [PokemonStats], types: [PokemonTypes], pastTypes: [PokemonPastTypes]) {
        self.id = id
        self.name = name
        self.baseExperience = baseExperience
        self.height = height
        self.weight = weight
        self.abilities = abilities
        self.forms = forms
        self.gameIndices = gameIndices
        self.heldItems = heldItems
        self.locationAreaEncounters = locationAreaEncounters
        self.moves = moves
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
        self.pastTypes = pastTypes
    }

}

class PokemonAbilities {
    let isHidden: Bool
    let slot: String
    let ability: PokemonNameUrl
    
    init(isHidden: Bool, slot: String, ability: PokemonNameUrl) {
        self.isHidden = isHidden
        self.slot = slot
        self.ability = ability
    }
}

class PokemonNameUrl {
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

class PokemonGameIndices {
    let gameIndex: String
    let version: PokemonNameUrl
    
    init(gameIndex: String, version: PokemonNameUrl) {
        self.gameIndex = gameIndex
        self.version = version
    }
}

class PokemonHeldItems {
    let item: PokemonNameUrl
    let versionDetails: [PokemonHeldItemVersionDetails]
    
    init(item: PokemonNameUrl, versionDetails: [PokemonHeldItemVersionDetails]) {
        self.item = item
        self.versionDetails = versionDetails
    }
}

class PokemonHeldItemVersionDetails {
    let rarity: String
    let version: PokemonNameUrl
    
    init(rarity: String, version: PokemonNameUrl) {
        self.rarity = rarity
        self.version = version
    }
}

class PokemonMoves {
    let move: PokemonNameUrl
    let versionGroupDetails: [PokemonMoveVersionGroupDetails]
    
    init(move: PokemonNameUrl, versionGroupDetails: [PokemonMoveVersionGroupDetails]) {
        self.move = move
        self.versionGroupDetails = versionGroupDetails
    }

}

class PokemonMoveVersionGroupDetails {
    let levelLearnedAt: String
    let versionGroup: PokemonNameUrl
    let moveLearnMethod: PokemonNameUrl
    
    init(levelLearnedAt: String, versionGroup: PokemonNameUrl, moveLearnMethod: PokemonNameUrl) {
        self.levelLearnedAt = levelLearnedAt
        self.versionGroup = versionGroup
        self.moveLearnMethod = moveLearnMethod
    }
}

class PokemonSprites {
    let frontDefault: String
    let backDefault: String
    let backShiny: String
    let frontShiny: String

    init(frontDefault: String, backDefault: String, backShiny: String, frontShiny: String) {
        self.frontDefault = frontDefault
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontShiny = frontShiny
    }
}

class PokemonStats {
    let baseStat: String
    let effort: String
    let stat: PokemonNameUrl

    init(baseStat: String, effort: String, stat: PokemonNameUrl) {
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
}

class PokemonTypes {
    let slot: String
    let type: PokemonNameUrl
    
    init(slot: String, type: PokemonNameUrl) {
        self.slot = slot
        self.type = type
    }

}

class PokemonPastTypes {
    let generation: PokemonNameUrl
    let types: [PokemonTypes]
    
    init(generation: PokemonNameUrl, types: [PokemonTypes]) {
        self.generation = generation
        self.types = types
    }
}
