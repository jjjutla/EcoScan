//
//  DeployTokenView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 17/03/2024.
//

import SwiftUI
import LocalAuthentication

struct DeployTokenView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel = ContentViewModel()
    
    @State private var tokenName: String = ""
    @State private var tokenDescription: String = ""
    @State private var faceIdApproved: Bool = false

    var capturedImage: UIImage?

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 12) {
                    Text("Image")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .hLeading()
                    
                    if let capturedImage = capturedImage {
                        Image(uiImage: capturedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth - 64)
                            .cornerRadius(16)
                    } else {
                        Image("icon2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth - 64)
                            .cornerRadius(16)
                    }
                    
                    Text("Metadata")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .hLeading()
                    
                    HStack {
                        Text("Name")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        
                        Spacer()
                    }
                    
                    TextField("Enter name of token", text: $tokenName)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.08))
                        }
                    
                    HStack {
                        Text("Description")
                            .font(.system(size: 16, weight: .semibold, design: .rounded))

                        Spacer()
                    }
                    
                    TextField("Enter description of token", text: $tokenDescription)
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.08))
                        }
                    
                    Button {
                        authenticate()
                    } label: {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 54)
                            .overlay(
                                Text("🍃 Tokenise your Review")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))

                                    .foregroundStyle(.white)
                            )
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal, 16)
                .navigationTitle("Leave a Review")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Dismiss")
                        }
                    }
                }
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.presentationMode.wrappedValue.dismiss()
                    }                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
}

//#Preview {
//    DeployTokenView()
//        .preferredColorScheme(.dark)
//}
