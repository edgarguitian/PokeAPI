//
//  PokemonListView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 4/1/24.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject private var viewModel: PokemonListViewModel
    
    init(viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PokemonListFactory.create()
}
