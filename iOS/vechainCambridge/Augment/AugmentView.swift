//
//  AugmentView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI
import UIKit

struct AugmentView: View {
    
    @State private var showARView: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 12) {
                        Button {
                            showARView.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "arkit")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                Text("Enter AR Experience")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                            }
                            .foregroundColor(.white)
                            .frame(width: UIScreen.screenWidth - 32, height: 60)
                            .background(.blue)
                            .cornerRadius(16)
                        }
                        
                        ForEach(arItems) { item in
                            ARPreviewView(arModel: item)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("Purchases")
            .fullScreenCover(isPresented: $showARView, content: {
                ARExperienceView()
            })
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
    AugmentView()
        .preferredColorScheme(.dark)
}
