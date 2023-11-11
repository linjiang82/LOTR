//
//  CurrencyPiece.swift
//  LOTR
//
//  Created by Jiang Lin on 22/10/2023.
//

import SwiftUI

struct CurrencyPiece: View {
    @State var currencyImage: String
    @State var currencyText: String
    var body: some View {
        ZStack{
            Image(currencyImage)
                .resizable()
                .scaledToFit()
                .padding(5)
            VStack {
                Spacer()
                Text(currencyText)
                    .background(.brown.opacity(0.75))
            }
        }
        .frame(width: 100, height: 100)
                .background(.brown)
                .cornerRadius(25)
    }
}

#Preview {
    CurrencyPiece(currencyImage:"goldpiece", currencyText: "Gold Piece").previewLayout(.sizeThatFits)
}
