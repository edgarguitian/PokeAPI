//
//  CustomLoadingView.swift
//  PokeAPI
//
//  Created by Edgar Guitian Rey on 11/1/24.
//

import SwiftUI

struct CustomLoadingView: View {
    var body: some View {
        HStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .frame(width: 20, height: 20)
            Text("Loading")
                .foregroundColor(.white)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.blue)

        )
    }
}

#Preview {
    CustomLoadingView()
}
