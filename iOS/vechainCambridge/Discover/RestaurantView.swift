//
//  RestaurantView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI

struct RestaurantView: View {
    
    var restaurant: Restaurant
    @State private var isLiked: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color(.white.opacity(0.1))
                .frame(width: 280, height: 180)
                .cornerRadius(24)
            
            VStack {
                HStack(alignment: .top) {
                    Text(restaurant.left)
                        .foregroundStyle(.white)
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .padding(6)
                        .background(.yellow.opacity(0.1))
                        .cornerRadius(60)
                        .padding([.leading, .top], 12)
                    
                    Spacer()
                    
                    
                    Button {
                        isLiked.toggle()
                    } label: {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.red)
                            .padding(8)
                            .background(.white.opacity(0.1))
                            .cornerRadius(50)
                            .padding([.trailing, .top], 10)
                            .scaleEffect(isLiked ? 1.1 : 1.0)
                            .transition(.scale.combined(with: .opacity))
                    }
                    
                }
                
                HStack {
                    Image(restaurant.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    
                    Text(restaurant.name)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(restaurant.itemName)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                            .hLeading()
                        
                        Text("Collect today " + restaurant.timeRange)
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .hLeading()
                        
                        HStack {
                            Image(systemName: "star.square.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.white)
                            
                            Text(restaurant.rating)
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                            
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 1, height: 16)
                                .foregroundColor(.white)
                            
                            Text(restaurant.distance)
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text(restaurant.price)
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .frame(width: 280, height: 180)
        .cornerRadius(24)
        .shadow(radius: 3)
    }
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var imageUrl: String
    var timeRange: String
    var itemName: String
    var rating: String
    var distance: String
    var price: String
    var left: String
}

var restaurants: [Restaurant] = [
    Restaurant(name: "Golden Hare", imageUrl: "hare", timeRange: "11:00 - 23:00", itemName: "Surprise Box", rating: "4.6", distance: "3.2 mi", price: "£ 15.90", left: "6+ left"),
    Restaurant(name: "Pret", imageUrl: "pret", timeRange: "20:00 - 00:00", itemName: "Coffee Box", rating: "4.2", distance: "1.2 mi", price: "£ 3.39", left: "4 left"),
    Restaurant(name: "Flat Iron", imageUrl: "flatiron", timeRange: "12:00 - 22:00", itemName: "Steakhouse Classics", rating: "4.8", distance: "2.5 mi", price: "£ 22.30", left: "5+ left"),
    Restaurant(name: "Honest Burgers", imageUrl: "honestburgers", timeRange: "23:00 - 00:00", itemName: "Snack Leftovers", rating: "4.5", distance: "0.2 mi", price: "£ 8.90", left: "2 left")
]

var restaurantsHurry: [Restaurant] = [
    Restaurant(name: "Flat Iron", imageUrl: "flatiron", timeRange: "18:00 - 22:00", itemName: "Steak Box", rating: "4.3", distance: "2.2 mi", price: "£ 12.90", left: "5+ left"),
    Restaurant(name: "Popeyes", imageUrl: "popeyes", timeRange: "12:00 - 00:00", itemName: "Chicken", rating: "4.4", distance: "1.8 mi", price: "£ 5.39", left: "4+ left"),
    Restaurant(name: "Costa Coffee", imageUrl: "costa", timeRange: "19:00 - 20:00", itemName: "Pastry Box", rating: "4.9", distance: "2.8 mi", price: "£ 5.39", left: "5+ left")
]

