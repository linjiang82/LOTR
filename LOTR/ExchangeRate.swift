//
//  ExchangeRate.swift
//  LOTR
//
//  Created by Jiang Lin on 22/10/2023.
//

import SwiftUI

struct ExchangeRate: View {
    @State var leftImage: String
    @State var rightImage: String
    @State var text: String
    var body: some View {
                HStack{
                    Image(leftImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33)
                    Text(text)
                    Image(rightImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
    }
}

#Preview {
    ExchangeRate(leftImage: "goldpiece" , rightImage: "goldpenny", text: "1 Gold Peiece = 4 Gold Pennies").previewLayout(.sizeThatFits)
}
