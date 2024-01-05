//
//  PokemonListView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject private var viewModel: PokemonListViewModel
    @State private var searchPokemon: String = ""
    
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            if viewModel.showLoadingSpinner {
                ProgressView()
            } else {
                if viewModel.showErrorMessage == nil {
                    NavigationStack {
                        ScrollView {
                            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 20) {
                                ForEach(viewModel.filteredPokemonList, id: \.self) { pokemon in
                                    PokemonCardView(pokemon: pokemon)
                                }
                            }
                            .padding(16)
                        }
                        .navigationTitle("Pokemons")
                        .searchable(text: $searchPokemon)
                        .onChange(of: searchPokemon) { _, newValue in
                            viewModel.search(searchPokemon: newValue)
                        }
                    }
                } else {
                    Text(viewModel.showErrorMessage!)
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct PokemonCardView: View {
    let pokemon: PokemonListPresentableItem
    
    var body: some View {
        VStack {
            AsyncImage(url: pokemon.image) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            Text("#\(pokemon.id)")
                .font(.subheadline)
            Text(pokemon.name)
                .font(.callout)
        }
        .padding(5)
        .background(Color.pokemonListBackground)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    PokemonListFactory.create()
}
