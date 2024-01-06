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
        VStack {
            AsyncImage(url: URL(string: viewModel.pokemonDetailInfo.sprites.frontDefault)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
            } placeholder: {
                ProgressView()
            }
            Text("#\(viewModel.pokemonDetailInfo.id)")
                .font(.subheadline)
            Text(viewModel.pokemonDetailInfo.name)
                .font(.callout)
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    PokemonDetailFactory().create(pokemonId: "1")
}
