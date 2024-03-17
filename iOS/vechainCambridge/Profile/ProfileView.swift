//
//  ProfileView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image("icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                            .cornerRadius(50)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Artemiy M.")
                                .font(.system(size: 20, weight: .regular, design: .rounded))
                        }
                        
                        Spacer()
                    }
                }
                
                Section(header: Text("Rewards")) {
                    VStack(spacing: 12) {
                        Text("18 B3TR Tokens")
                            .font(.system(size: 28, weight: .semibold, design: .rounded))
                            .hLeading()
                        
                        HStack(spacing: 4) {
                            Text("Stored safely on your ")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                            
                            Image("veworld")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 24, height: 24)
                                .cornerRadius(4)
                            
                            Text("VeWorld")
                                .font(.system(size: 16, weight: .bold, design: .rounded))

                        }
                        .hLeading()

                    }
                }
                
                Section(header: Text("Impact")) {
                    HStack {
                        VStack(spacing: 12) {
                            Text("CO2 avoided")
                                .font(.system(size: 17, weight: .bold, design: .rounded))
                                .hCenter()
                            
                            Image(systemName: "leaf")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36, height: 36)
                                .foregroundColor(Color(red: 0, green: 1, blue: 0.5))
                            
                            Text("49 kg")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                            
                        }
                        
                        VStack(spacing: 12) {
                            Text("Energy saved")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .hCenter()
                            
                            Image(systemName: "bolt")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 36, height: 36)
                                .foregroundColor(Color(red: 1, green: 1, blue: 0.5))
                            
                            Text("385 kWh")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                        }
                    }
                    .padding(.vertical, 4)
                }
                
                Section(header: Text("General")) {
                    NavigationLink {
                        
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "info")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 10, height: 10)
                                .padding(10)
                                .cornerRadius(8)
                            
                            Text("Wallet Information")
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "gearshape")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                                .padding(5)
                                .cornerRadius(8)
                            
                            Text("Settings")
                        }
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18)
                                .padding(6)
                                .cornerRadius(8)
                            
                            Text("Account Details")
                        }
                    }
                }
                
                Section(header: Text("Connections")) {
                    HStack {
                        Image("walletconnect")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 26, height: 26)
                        
                        Text("WalletConnect")
                        
                        Spacer()
                        
                        Text("Not Connected")
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    
                    HStack {
                        Image("google")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 26, height: 26)
                        
                        Text("Google")
                        
                        Spacer()
                        
                        Text("Connected")
                            .foregroundStyle(.white.opacity(0.7))
                    }
                }
                
                Section {
                    Button {
                        UserDefaults.standard.set(false, forKey: "signin")
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "arrow.uturn.left")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18)
                                .foregroundStyle(.red)
                                .padding(6)
                                .cornerRadius(8)
                            
                            Text("Log Out")
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .navigationTitle("Profile")

        }
    }
    
    func shortenAddress(address: String) -> String {
        guard address.count > 8 else { return address }
        let startIndex = address.index(address.startIndex, offsetBy: 6)
        let endIndex = address.index(address.endIndex, offsetBy: -4)
        return "\(address[..<startIndex])...\(address[endIndex...])"
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
    ProfileView()
        .preferredColorScheme(.dark)
}
