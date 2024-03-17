//
//  TabBarView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI

import SwiftUI

struct TabBarView: View {
    @AppStorage("signin") var isSignedIn = false

    var body: some View {
        TabView {
            DiscoverView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "bag.fill")
                }
                
            AugmentView()
                .tabItem {
                    Label("AR View", systemImage: "arkit")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
        .preferredColorScheme(.dark)
}
