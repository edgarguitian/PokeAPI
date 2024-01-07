//
//  PokemonDetailItemView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 7/1/24.
//

import SwiftUI

struct PokemonDetailItemView: View {
    let title: String
    let value: String
    var body: some View {
        HStack {
            Text(title)
                .font(.callout)
                .lineLimit(1)

            Spacer()

            Text(value)
                .font(.callout)
                .lineLimit(1)

        }
        .padding()
        .background(Color("BackgroundItemColor"))
        .cornerRadius(10)
    }
}

#Preview {
    PokemonDetailItemView(title: "Height", value: "12")
}
