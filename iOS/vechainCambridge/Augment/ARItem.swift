//
//  ARItem.swift
//  vechainCambridge
//
//  Created by Artemiy Malyshau on 16/03/2024.
//

import Foundation

struct ARItem: Identifiable, Decodable {
    var id = UUID()
    var place: String
    var name: String
    var imageURL: String
    var model: String
    var modelURL: URL?
}


var arItems: [ARItem] = [
    ARItem(
        place: "Costa",
        name: "Sandwich Meal",
        imageURL: "sandwich",
        model: "sandwich.usdz",
        modelURL: URL(string: "http://176.58.109.155/model/usdz/018e47fb-b310-774c-84ab-176f1490565f")!
    ),
    ARItem(
        place: "Tesco's", name: "Coke Can", imageURL: "coke", model: "coke.usdz"
    )
]

var arItemsHare: [ARItem] = [
    ARItem(
        place: "Costa",
        name: "Sandwich Meal",
        imageURL: "sandwich",
        model: "sandwich.usdz",
        modelURL: URL(string: "http://176.58.109.155/model/usdz/018e47fb-b310-774c-84ab-176f1490565f")!
    ),
]
