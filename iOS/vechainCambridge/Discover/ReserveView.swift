//
//  ReserveView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 17/03/2024.
//

import SwiftUI

struct ReserveView: View {
    
    var restaurant: Restaurant    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var quantityNumber: Int = 1
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 10, height: 10)
                        .padding(8)
                        .background(.gray.opacity(0.4))
                        .cornerRadius(50)
                }
            }
            .padding(.vertical, 6)
            
            VStack(spacing: 4) {
                Text(restaurant.name)
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .hLeading()
                
                
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text("Collect today " + restaurant.timeRange)
                }
                .hLeading()
                
                
            }
            .padding()
            .background(.white.opacity(0.08))
            .cornerRadius(16)
            
            VStack(spacing: 20) {
                Text("Select quantity")
                
                HStack(alignment: .center, spacing: 20) {
                    Button {
                        quantityNumber -= 1
                    } label: {
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(.white.opacity(0.1))
                            .cornerRadius(50)
                    }
                    
                    Text(String(quantityNumber))
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                    
                    Button {
                        quantityNumber += 1
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(.white.opacity(0.1))
                            .cornerRadius(50)
                    }
                }
                
                (Text("By reserving this meal you agree to DealDish's \n") + Text("Terms and Conditions").foregroundStyle(.blue))
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .frame(width: UIScreen.screenWidth - 64)
                    .lineLimit(2)
            }
            .padding()
            .background(.white.opacity(0.08))
            .cornerRadius(16)
            
            VStack {
                HStack {
                    Text("Total")
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                    
                    Spacer()
                    
                    Text(restaurant.price)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: .infinity, height: 50)
                        .foregroundColor(.white.opacity(0.2))
                        .overlay(
                            HStack(spacing: 4) {
                                Image("apple")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 22, height: 22)
                                    .padding(.bottom, 2)
                                
                                Text("Pay")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        )
                }
                
                Text("Other payment method")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .padding(.top, 12)
            }
            .padding()
            .background(.white.opacity(0.08))
            .cornerRadius(16)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ReserveView(restaurant: restaurants[0])
        .preferredColorScheme(.dark)
}
