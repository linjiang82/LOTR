//
//  ContentView.swift
//  LOTR
//
//  Created by Jiang Lin on 20/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    @State var leftAmountTemp: String = ""
    @State var rightAmountTemp: String = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var leftCurrency: Currency = Currency.allCases[UserDefaults.standard.integer(forKey: "leftCurrency")]
    @State var rightCurrency: Currency = Currency.allCases[UserDefaults.standard.integer(forKey: "rightCurrency")]
    @State var showSelectCurrency = false
    @State var showExchangeInfo = false
   
    var body: some View {
        ZStack{
            // bg image
            Image(.background)
                .resizable()
                .ignoresSafeArea(.all)
            VStack{
               // pony image
            Image(.prancingpony)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                //currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
            
                // currency convsersion setion
                HStack{
                    // Left section
                    VStack{
                        HStack{
                            // currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                           
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        // text field
                        TextField("Amount", text: $leftAmount, onEditingChanged: {
                            typing in
                            leftTyping = typing
                            leftAmountTemp = leftAmount
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftTyping ? leftAmount : leftAmountTemp){
                                _ in
                                rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                            }
                    }
                   // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                    // Right section
                    VStack{
                        HStack{
                            // currency image
                            Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            //currency text
                            Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        // text field
                        TextField("Amount", text: $rightAmount, onEditingChanged: { typing in
                            rightTyping = typing
                            rightAmountTemp = rightAmount
                            
                        })
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightTyping ? rightAmount : rightAmountTemp){
                                _ in
                                leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(50)
                
                Spacer()
                //info button
                HStack{
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfo()
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
