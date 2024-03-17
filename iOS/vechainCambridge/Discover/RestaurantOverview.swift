//
//  RestaurantOverview.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI

struct RestaurantOverview: View {
    
    var restaurant: Restaurant
    
    @State private var selectedSegmentIndex = 0
    let segments = ["Details", "Reviews"]
    
    @State private var showWalletView: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
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
                    
                    VStack {
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
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 6)
                    .background(.white.opacity(0.06))
                    .cornerRadius(16)
                    
                    HStack(spacing: 6) {
                        Image(systemName: "map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("66 Chesterton Rd, \nCambridge CB4 1EP")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .padding(.leading, 6)
                                .hLeading()
                            
                            Text("More information about the store")
                                .font(.caption)
                                .padding(.leading, 6)
                                .padding(.top, 2)
                                .foregroundColor(.white.opacity(0.8))
                                .hLeading()
                        }
                        
                        Spacer()
                        
                        Text("Location")
                            .font(.system(size: 16, weight: .regular, design: .rounded))
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                    }
                    .padding()
                    .background(.white.opacity(0.06))
                    .cornerRadius(16)
                    
                    Picker("Options", selection: $selectedSegmentIndex) {
                        ForEach(0..<segments.count) { index in
                            Text(self.segments[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.gray.opacity(0.2).cornerRadius(8))
                    .padding(.vertical, 12)
                    
                    if selectedSegmentIndex == 0 {
                        VStack {
                            Text("What you could get")
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .padding(.bottom, 4)
                                .hLeading()
                            
                            Text("Rescue an assortment of items which could include grocery, sandwiches, ready meals, dairy products, baked goods, produce and/or cupboard items.")
                                .font(.system(size: 15, weight: .regular, design: .rounded))
                                .padding(.bottom, 12)
                        }
                        .padding()
                        .background(.white.opacity(0.06))
                        .cornerRadius(16)
                        .padding(.bottom, 8)
                        
                        HStack {
                            Button {
                                showWalletView.toggle()
                            } label : {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: .infinity, height: 50)
                                    .foregroundColor(.white.opacity(0.2))
                                    .overlay(
                                        HStack {
                                            Image(systemName: "dollarsign")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                            
                                            Text("Reserve")
                                                .font(.headline).bold()
                                        }
                                    )
                            }
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: 50)
                                .foregroundColor(.white.opacity(0.2))
                                .overlay(
                                    HStack {
                                        Image(systemName: "arkit")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 18, height: 18)
                                        
                                        Text("View in AR")
                                            .font(.headline).bold()
                                    }
                                )
                        }

                    } else if selectedSegmentIndex == 1 {
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: .infinity, height: 50)
                                .foregroundColor(.white.opacity(0.2))
                                .overlay(
                                    HStack(spacing: 8) {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16, height: 16)
                                        
                                        Text("Add Review")
                                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    }
                                )
                        }
                        
                        VStack(spacing: 0) {
                            Text("Matches the advertisement!")
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                                .padding(.bottom, 4)
                                .hLeading()
                            
                            HStack(alignment: .center) {
                                Image("icon2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .cornerRadius(50)
                                
                                Text("nkoorty")
                                    .font(.system(size: 12, weight: .regular, design: .rounded))
                                    .foregroundColor(.white.opacity(0.8))
                                    .hLeading()
                                
                                Spacer()
                                
                                Text("1d ago")
                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            
                            Text("Was surprised to see that I actually received a little more than expected, check out the image!")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .hLeading()
                                .padding(.top, 8)
                            
                            HStack {
                                Image("coke")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)
                            }
                            .hLeading()
                            .padding(.top, 12)

                        }
                        .padding()
                        .background(.white.opacity(0.08))
                        .cornerRadius(16)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showWalletView) {
            ReserveView(restaurant: restaurant)
                .presentationDetents([.fraction(0.64)])
        }
    }
}

#Preview {
    RestaurantOverview(restaurant: restaurants[0])
        .preferredColorScheme(.dark)
}
