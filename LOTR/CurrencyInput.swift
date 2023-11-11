//
//  CurrencyInput.swift
//  LOTR
//
//  Created by Jiang Lin on 23/10/2023.
//

import SwiftUI

struct CurrencyInput: View {
    @Binding var currency:Currency
    @Binding var view: SelectCurrency
    @Binding var amount: String
    @Binding var amountTemp: String
    @State var isTyping = false
    @State var showSelectCurrency = false
    
    var body: some View {
                    VStack{
                        HStack{
                            // currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: currency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: currency)!].rawValue)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                           
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            view
                        })
                        // text field
                        TextField("Amount", text: $amount, onEditingChanged: {
                            typing in
                            isTyping = typing
                            amountTemp = amount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: isTyping ? amount : amountTemp){
                                _ in
                                amount = currency.convert(amountString: amount, to: currency)
                            }
                    }
        
    }
}

#Preview {
    CurrencyInput(currency: <#Binding<Currency>#>, view: <#Binding<SelectCurrency>#>, amount: <#Binding<String>#>, amountTemp: <#Binding<String>#>)
}
