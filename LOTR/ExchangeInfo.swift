//
//  ExchangeInfo.swift
//  LOTR
//
//  Created by Jiang Lin on 22/10/2023.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            //background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)
            
            //content
            VStack{
                // header
                Text("Exchange Rates")
                    .font(.largeTitle)
                
                // test
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                // list of hstack
                ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", text: "1 Gold Piece = 4 Gold Pennies")
                ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", text: "1 Gold Piece = 4 Gold Pennies")
                ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", text: "1 Gold Piece = 4 Gold Pennies")
                ExchangeRate(leftImage: "goldpiece", rightImage: "goldpenny", text: "1 Gold Piece = 4 Gold Pennies")
                
                // button
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
        .foregroundStyle(.black)
        }
    }

#Preview {
    ExchangeInfo().preferredColorScheme(.dark)
}
