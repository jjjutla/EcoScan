//
//  LoginView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import Firebase


struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.green.opacity(0.3), Color.clear]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 4) {
                    Text("DishDeal")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.top, 80)
                        .hLeading()
                    
                    Text("Sign in using the methods below")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white.opacity(0.7))
                        .hLeading()
                    
                    TextField("E-mail address", text: $email)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.08))
                        }
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .padding(.top, 60)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    Color.white.opacity(0.08)
                                )
                        }
                        .textInputAutocapitalization(.never)
                        .padding(.top, 4)
                        .padding(.bottom, 36)
                    
                    Button {
                        UserDefaults.standard.set(true, forKey: "signin")
                    } label: {
                        HStack {
                            Text("Sign In")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        .hCenter()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.16))
                                .frame(height: 50)
                        )
                    }
                    .padding(.bottom, 42)
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 2)
                            .foregroundColor(.white.opacity(0.3))
                        
                        Text("OR")
                            .foregroundColor(.white.opacity(0.3))
                        
                        RoundedRectangle(cornerRadius: 50)
                            .frame(width: 150, height: 2)
                            .foregroundColor(.white.opacity(0.3))
                    }
                    .padding(.bottom, 40)
                    
                    Button {
                        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

                        let config = GIDConfiguration(clientID: clientID)
                        GIDSignIn.sharedInstance.configuration = config

                        GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
                          guard error == nil else {
                              return
                          }

                          guard let user = result?.user,
                            let idToken = user.idToken?.tokenString
                          else {
                              return
                          }

                          let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)

                            Auth.auth().signIn(with: credential) { result, error in

                                guard error == nil else {
                                    return
                                }
                                
                                print("Signed in")
                                UserDefaults.standard.set(true, forKey: "signin")
                            }
                        }
                    } label: {
                        HStack(spacing: 12) {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            
                            Text("Sign in with Google")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        .hCenter()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.16))
                                .frame(height: 50)
                        )
                        .padding(.bottom, 28)
                    }
                    
                    Button {
                        UserDefaults.standard.set(true, forKey: "signin")
                    } label: {
                        HStack(spacing: 12) {
                            Image("walletconnect")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 28)
                            
                            Text("Sign in with WalletConnect")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        .hCenter()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(0.16))
                                .frame(height: 50)
                        )
                        .padding(.bottom, 28)
                    }
                    
                    (Text("By continuing, you agree to our ") + Text("User Agreement ").foregroundStyle(.blue) + Text("and ") + Text("Privacy Policy").foregroundStyle(.blue))
                        .font(.system(size: 12, weight: .semibold))
                        .hCenter()
                        .padding(.top, 60)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    LoginView()
        .preferredColorScheme(.dark)
}
