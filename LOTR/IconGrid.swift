//
//  IconGrid.swift
//  LOTR
//
//  Created by Jiang Lin on 22/10/2023.
//

import SwiftUI

struct IconGrid: View {
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    let currencySelectionHandler: ()-> Void

    var body: some View {
        LazyVGrid(columns: gridLayout, content: {
            ForEach(0..<5){i in
                if currency == Currency.allCases[i]{
                CurrencyPiece(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(lineWidth: 3).foregroundStyle(.green).opacity(0.5))
                    .shadow(color: .black, radius: 9)
                }
                else {
                    CurrencyPiece(currencyImage: CurrencyImage.allCases[i].rawValue, currencyText: CurrencyText.allCases[i].rawValue)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                            self.currencySelectionHandler()
                        }
                }
                
            }
        })
        .padding([.bottom, .leading, .trailing])
    }
}

#Preview {
    IconGrid(currency: .constant(.goldPenny), currencySelectionHandler:{})
}
