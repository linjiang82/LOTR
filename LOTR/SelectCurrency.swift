//
//  SelectCurrency.swift
//  LOTR
//
//  Created by Jiang Lin on 22/10/2023.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    func leftCurrencySelectionHandler() -> Void {
        UserDefaults.standard.set(Currency.allCases.firstIndex(of: leftCurrency), forKey: "leftCurrency")
    }
    
    func rightCurrencySelectionHandler() -> Void {
        UserDefaults.standard.set(Currency.allCases.firstIndex(of: rightCurrency), forKey: "rightCurrency")
    }
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)
            
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                
                IconGrid(currency: $leftCurrency, currencySelectionHandler: self.leftCurrencySelectionHandler)
                
                Text("Select the currrency you would like to convert to:")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                
                IconGrid(currency: $rightCurrency, currencySelectionHandler: self.rightCurrencySelectionHandler)
                
                Button("Done"){
                   dismiss()
                }
                .font(.largeTitle)
                .padding(10)
                .foregroundStyle(.white)
                .background(.brown)
                .cornerRadius(15)
            }
            
            
        }
    }
}

#Preview {
    SelectCurrency(leftCurrency: .constant(.copperPenny), rightCurrency:.constant(.goldPiece))
}
