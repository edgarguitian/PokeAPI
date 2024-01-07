//
//  SinglePokemonInfo.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import Foundation

struct SinglePokemonInfo {
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
        self.name = name.capitalizeFirstLetter()
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
    
    init(response: PokemonListInfoDTO) {
        self.id = String(response.id)
        self.name = response.name.capitalizeFirstLetter()
        self.baseExperience = String(response.baseExperience)
        self.height = String(response.height)
        self.weight = String(response.weight)
        self.abilities = response.abilities.map { PokemonAbilities(response: $0) }
        self.forms = response.forms.map { PokemonNameUrl(name: $0.name, url: $0.url) }
        self.gameIndices = response.gameIndices.map { PokemonGameIndices(gameIndex: String($0.gameIndex), version: PokemonNameUrl(name: $0.version.name, url: $0.version.url)) }
        self.heldItems = response.heldItems.map { PokemonHeldItems(item: PokemonNameUrl(name: $0.item.name, url: $0.item.url), versionDetails: $0.versionDetails.map { PokemonHeldItemVersionDetails(rarity: String($0.rarity), version: PokemonNameUrl(name: $0.version.name, url: $0.version.url)) }) }
        self.locationAreaEncounters = response.locationAreaEncounters
        self.moves = response.moves.map { PokemonMoves(move: PokemonNameUrl(name: $0.move.name, url: $0.move.url), versionGroupDetails: $0.versionGroupDetails.map { PokemonMoveVersionGroupDetails(levelLearnedAt: String($0.levelLearnedAt), versionGroup: PokemonNameUrl(name: $0.versionGroup.name, url: $0.versionGroup.url), moveLearnMethod: PokemonNameUrl(name: $0.moveLearnMethod.name, url: $0.moveLearnMethod.url)) }) }
        self.species = PokemonNameUrl(name: response.species.name, url: response.species.url)
        self.sprites = PokemonSprites(frontDefault: response.sprites.frontDefault,
                                      backDefault: response.sprites.backDefault,
                                      backShiny: response.sprites.backShiny,
                                      frontShiny: response.sprites.frontShiny)
        self.stats = response.stats.map { PokemonStats(baseStat: String($0.baseStat), effort: String($0.effort), stat: PokemonNameUrl(name: $0.stat.name, url: $0.stat.url)) }
        self.types = response.types.map { PokemonTypes(slot: String($0.slot), type: PokemonNameUrl(name: $0.type.name, url: $0.type.url)) }
        self.pastTypes = response.pastTypes.map { PokemonPastTypes(generation: PokemonNameUrl(name: $0.generation.name, url: $0.generation.url), types: $0.types.map { PokemonTypes(slot: String($0.slot), type: PokemonNameUrl(name: $0.type.name, url: $0.type.url)) }) }
    }

}

struct PokemonAbilities {
    let isHidden: Bool
    let slot: String
    let ability: PokemonNameUrl
    
    init(isHidden: Bool, slot: String, ability: PokemonNameUrl) {
        self.isHidden = isHidden
        self.slot = slot
        self.ability = ability
    }
    
    init(response: PokemonAbilitiesDTO) {
        self.isHidden = response.isHidden
        self.slot = String(response.slot)
        self.ability = PokemonNameUrl(name: response.ability.name, url: response.ability.url)
    }
}


struct PokemonNameUrl {
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

struct PokemonGameIndices {
    let gameIndex: String
    let version: PokemonNameUrl
    
    init(gameIndex: String, version: PokemonNameUrl) {
        self.gameIndex = gameIndex
        self.version = version
    }
}

struct PokemonHeldItems {
    let item: PokemonNameUrl
    let versionDetails: [PokemonHeldItemVersionDetails]
    
    init(item: PokemonNameUrl, versionDetails: [PokemonHeldItemVersionDetails]) {
        self.item = item
        self.versionDetails = versionDetails
    }
}

struct PokemonHeldItemVersionDetails {
    let rarity: String
    let version: PokemonNameUrl
    
    init(rarity: String, version: PokemonNameUrl) {
        self.rarity = rarity
        self.version = version
    }
}

struct PokemonMoves {
    let move: PokemonNameUrl
    let versionGroupDetails: [PokemonMoveVersionGroupDetails]
    
    init(move: PokemonNameUrl, versionGroupDetails: [PokemonMoveVersionGroupDetails]) {
        self.move = move
        self.versionGroupDetails = versionGroupDetails
    }

}

struct PokemonMoveVersionGroupDetails {
    let levelLearnedAt: String
    let versionGroup: PokemonNameUrl
    let moveLearnMethod: PokemonNameUrl
    
    init(levelLearnedAt: String, versionGroup: PokemonNameUrl, moveLearnMethod: PokemonNameUrl) {
        self.levelLearnedAt = levelLearnedAt
        self.versionGroup = versionGroup
        self.moveLearnMethod = moveLearnMethod
    }
}

struct PokemonSprites {
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

struct PokemonStats {
    let baseStat: String
    let effort: String
    let stat: PokemonNameUrl

    init(baseStat: String, effort: String, stat: PokemonNameUrl) {
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
}

struct PokemonTypes {
    let slot: String
    let type: PokemonNameUrl
    
    init(slot: String, type: PokemonNameUrl) {
        self.slot = slot
        self.type = type
    }

}

struct PokemonPastTypes {
    let generation: PokemonNameUrl
    let types: [PokemonTypes]
    
    init(generation: PokemonNameUrl, types: [PokemonTypes]) {
        self.generation = generation
        self.types = types
    }
}


extension PokemonAbilities: Hashable {
    func hash(into hasher: inout Hasher) {
            hasher.combine(isHidden)
            hasher.combine(slot)
            hasher.combine(ability)
        }

        static func == (lhs: PokemonAbilities, rhs: PokemonAbilities) -> Bool {
            return lhs.isHidden == rhs.isHidden && lhs.slot == rhs.slot && lhs.ability == rhs.ability
        }
}

extension PokemonNameUrl: Hashable {
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(url)
        }

        static func == (lhs: PokemonNameUrl, rhs: PokemonNameUrl) -> Bool {
            return lhs.name == rhs.name && lhs.url == rhs.url
        }
}

extension PokemonGameIndices: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(gameIndex)
        hasher.combine(version)
    }

    static func == (lhs: PokemonGameIndices, rhs: PokemonGameIndices) -> Bool {
        return lhs.gameIndex == rhs.gameIndex && lhs.version == rhs.version
    }
}

extension PokemonHeldItemVersionDetails: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(rarity)
        hasher.combine(version)
    }

    static func == (lhs: PokemonHeldItemVersionDetails, rhs: PokemonHeldItemVersionDetails) -> Bool {
        return lhs.rarity == rhs.rarity && lhs.version == rhs.version
    }
}


extension PokemonHeldItems: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(item)
        hasher.combine(versionDetails)
    }

    static func == (lhs: PokemonHeldItems, rhs: PokemonHeldItems) -> Bool {
        return lhs.item == rhs.item && lhs.versionDetails == rhs.versionDetails
    }
}

extension PokemonMoves: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(move)
        hasher.combine(versionGroupDetails)
    }

    static func == (lhs: PokemonMoves, rhs: PokemonMoves) -> Bool {
        return lhs.move == rhs.move && lhs.versionGroupDetails == rhs.versionGroupDetails
    }
}

extension PokemonMoveVersionGroupDetails: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(levelLearnedAt)
        hasher.combine(versionGroup)
        hasher.combine(moveLearnMethod)
    }

    static func == (lhs: PokemonMoveVersionGroupDetails, rhs: PokemonMoveVersionGroupDetails) -> Bool {
        return lhs.levelLearnedAt == rhs.levelLearnedAt && lhs.versionGroup == rhs.versionGroup && lhs.moveLearnMethod == rhs.moveLearnMethod
    }
}

extension PokemonStats: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(baseStat)
        hasher.combine(effort)
        hasher.combine(stat)
    }

    static func == (lhs: PokemonStats, rhs: PokemonStats) -> Bool {
        return lhs.baseStat == rhs.baseStat && lhs.effort == rhs.effort && lhs.stat == rhs.stat
    }
}

extension PokemonTypes: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(slot)
        hasher.combine(type)
    }

    static func == (lhs: PokemonTypes, rhs: PokemonTypes) -> Bool {
        return lhs.slot == rhs.slot && lhs.type == rhs.type
    }
}

extension PokemonPastTypes: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(generation)
        hasher.combine(types)
    }

    static func == (lhs: PokemonPastTypes, rhs: PokemonPastTypes) -> Bool {
        return lhs.generation == rhs.generation && lhs.types == rhs.types
    }
}

