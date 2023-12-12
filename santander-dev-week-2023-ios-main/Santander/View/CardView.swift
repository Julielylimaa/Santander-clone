//
//  CardView.swift
//  Santander
//
//  Created by Juliely Lima on 12/12/23.
//

import SwiftUI

struct CardView: View {
    @StateObject var viewModel = CardViewModel()
    
    @State private var cardClosed = true
    @State private var isRotation = 360.0
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 333, height: cardClosed ? 66 : 250)
            .background(Color.santanderRed)
            .cornerRadius(6)
            .shadow(color: .black.opacity(0.15), radius: 4.5, x: .zero, y:4)
            .overlay(alignment: .topLeading, content:{
                VStack{
                    HStack{
                        Text(viewModel.number)
                            .font(.openSansSemiBold(size: 18))
                            .kerning(0.18)
                            .foregroundColor(.white)
                        Spacer()
                        Image("card_card_icon")
                            .rotationEffect(.degrees(isRotation))
                            .frame(width: 23.2374, height: 11.65924)
                            .onTapGesture {
                                withAnimation{
                                    isRotation = cardClosed ? 180.0 : 360.0
                                    cardClosed.toggle()
                                }
                            }
                    }
                    if !cardClosed{
                        VStack(alignment: .leading){
                            Text("Santander SX")
                                .font(.openSansBold(size: 18))
                                .kerning(0.18)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 8.0)
                        VStack(alignment: .leading){
                            HStack{
                                Text("Limite disponível")
                                    .font(.openSansBold(size: 18))
                                    .kerning(0.18)
                                    .foregroundColor(.white)
                                Spacer()
                                Text(viewModel.limit)
                                    .font(.openSansBold(size: 18))
                                    .kerning(0.18)
                                    .foregroundColor(.white)
                            }
                            .padding(.top, 16.0)
                        }
                        if !cardClosed{
                            VStack(alignment: .center){
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 283, height: 2)
                                    .background(Color.santanderGray)
                                    .cornerRadius(75)
                                Text("Ver fatura")
                                    .font(.openSansSemiBold(size: 18))
                                    .kerning(0.18)
                                    .foregroundColor(.white)
                                    .padding(.top, 4.0)
                            }
                            .padding(.top, 32.0)
                        }
                    }
                }
                .padding([.top, .leading, .trailing], 25.0)
            })
    }
}

#Preview {
    CardView()
}
