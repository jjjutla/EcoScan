//
//  DiscoverView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI

struct DiscoverView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Hello World!")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("See all")
                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                    .foregroundStyle(.white.opacity(0.8))

                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 10, height: 10)
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                ForEach(restaurants) { restaurant in
                                    NavigationLink {
                                        RestaurantOverview(restaurant: restaurant)
                                    } label: {
                                        RestaurantView(restaurant: restaurant)
                                    }
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .safeAreaPadding(.horizontal, 16)
                        
                        HStack {
                            Text("Hurry now!")
                                .font(.system(size: 18, weight: .bold, design: .rounded))

                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Text("See all")
                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                    .foregroundStyle(.white.opacity(0.8))
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 10, height: 10)
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 20) {
                                ForEach(restaurants) { restaurant in
                                    NavigationLink {
                                        RestaurantOverview(restaurant: restaurant)
                                    } label: {
                                        RestaurantView(restaurant: restaurant)
                                    }
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .safeAreaPadding(.horizontal, 16)
                        
                        ZStack {
                            Image("coke")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 360, height: 200)
                                .cornerRadius(16)
                            
                            VStack {
                                HStack {
                                    Image("hare")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 34, height: 34)
                                        .padding(2)
                                        .background(.white)
                                        .cornerRadius(50)
                                    
                                    Image("hare")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 34, height: 34)
                                        .padding(2)
                                        .background(.white)
                                        .cornerRadius(50)
                                        .offset(x: -24)
                                        .shadow(radius: 2)
                                    
                                    Spacer()
                                }
                                .padding([.leading, .top], 16)
                                .padding(.horizontal, 16)
                                
                                HStack {
                                    Text("Support the WeBetter DAO")
                                        .font(.system(size: 22, weight: .bold, design: .rounded))
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 32)
                                
                                Spacer()
                                
                                HStack {
                                    Spacer()
                                    
                                    Text("Support")
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                        .frame(width: 140, height: 42)
                                        .background(Color(red: 0, green: 0.4, blue: 0))
                                        .cornerRadius(50)
                                        .shadow(radius: 2)
                                        .padding([.trailing, .bottom], 16)
                                        .padding(.horizontal, 16)
                                }
                            }
                        }
                        .padding(.top, 32)
                    }
                }
            }
            .navigationTitle("Discover")
            .searchable(text: $searchText)
        }
    }
    
    init() {
        var titleFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleFont = UIFont(
            descriptor:
                titleFont.fontDescriptor
                .withDesign(.rounded)?
                .withSymbolicTraits(.traitBold)
                ??
                titleFont.fontDescriptor,
            size: titleFont.pointSize
        )
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: titleFont]
    }
}

#Preview {
    DiscoverView()
        .preferredColorScheme(.dark)
}
