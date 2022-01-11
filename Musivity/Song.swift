//
//  Song.swift
//  Musivity
//
//  Created by Tillie Ferguson on 1/11/22.
//  Based on tutorial created by Gary Tokman on 2/15/21.
//

import Foundation

struct Song: Identifiable {
    let id: UUID = .init()
    let name: String
    let artist: String
    let image: String
    let audio: String
    var isBehind: Bool = true
    
    static let songs = [
        Song(name: "Red", artist: "Taylor Swift", image: "ts", audio: "hi"),
        Song(name: "betty", artist: "Taylor Swift", image: "ts", audio: "hi"),
        Song(name: "august", artist: "Taylor Swift", image: "ts", audio: "hi"),
        Song(name: "invisible string", artist: "Taylor Swift", image: "ts", audio: "hi"),
        Song(name: "Getaway Car", artist: "Taylor Swift", image: "ts", audio: "hi", isBehind: false)
    ]
}
