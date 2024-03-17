//
//  RestaurantOverview.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI

struct RestaurantOverview: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.green.opacity(0.3), Color.clear]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(restaurant.left)
                        .foregroundStyle(.white)
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .padding(6)
                        .background(.yellow.opacity(0.1))
                        .cornerRadius(60)
                    
                    Spacer()
                }
                .padding(.bottom, 6 )
                
                HStack(spacing: 12) {
                    Image(restaurant.imageUrl)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72, height: 72)
                        .cornerRadius(50)
                    
                    Text(restaurant.name)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "bag")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text(restaurant.itemName)
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                    
                    Spacer()
                }
                .padding(.top, 8)
                
                HStack {
                    Image(systemName: "star.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    
                    Text(restaurant.rating)
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                    
                    Spacer()
                    
                    Text(restaurant.price)
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                }
                
                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    
                    Text(restaurant.timeRange)
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                    
                    Spacer()
                    
                }
                .offset(y: -4)
                
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 360, height: 1)
                    .padding(.vertical, 12)
                    .foregroundColor(.white.opacity(0.7))
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RestaurantOverview(restaurant: restaurants[0])
        .preferredColorScheme(.dark)
}
