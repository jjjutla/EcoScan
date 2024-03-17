//
//  vechainCambridgeApp.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI

@main
struct vechainCambridgeApp: App {
    
    @AppStorage("signin") var isSignedIn = false

    var body: some Scene {
        WindowGroup {
            if isSignedIn {
                TabBarView()
                    .preferredColorScheme(.dark)
            } else {
                LoginView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
