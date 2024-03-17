//
//  ARPreviewView.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import SwiftUI

struct ARPreviewView: View {

    var arModel: ARItem

    var body: some View {
        HStack(spacing: 12) {
            Image(arModel.imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(arModel.place + " - " + arModel.name)
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                }
                
                Text("17.3.2024")
                    .font(.system(size: 15, design: .rounded))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button {
                let urlString = "https://apple.com"

                if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Image(systemName: "arkit")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
        }
        .padding(14)
        .background(.white.opacity(0.14))
        .cornerRadius(20)
    }
}

#Preview {
    ARPreviewView(arModel: ARItem(place: "Costa", name: "Rubik's cube", imageURL: "coke", model: "model.usdz", modelURL: URL(string: "http://176.58.109.155/model/usdz/018e47fb-b310-774c-84ab-176f1490565f")!))
        .preferredColorScheme(.dark)
}
