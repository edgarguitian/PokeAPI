//
//  PokemonDetailView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 6/1/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject private var viewModel: PokemonDetailViewModel

    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        PokemonDetailItemView(pokemon: pokemon)
    }
}

#Preview {
    PokemonDetailFactory().create(with: pokemon)
}

var pokemon = PokemonListPresentableItem(id: "1", name: "Pikachu", image: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")!)

struct PokemonDetailItemView: View {
    let pokemon: PokemonListPresentableItem
    
    var body: some View {
        VStack {
            AsyncImage(url: pokemon.image) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
            } placeholder: {
                ProgressView()
            }
            Text("#\(pokemon.id)")
                .font(.subheadline)
            Text(pokemon.name)
                .font(.callout)
        }
        .padding(5)
    }
}
