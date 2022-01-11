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
        Song(name: "Going Higher", artist: "Taylor Swift", image: "goinghigher", audio: "bensound-goinghigher"),
        Song(name: "dubstep", artist: "Taylor Swift", image: "dubstep", audio: "bensound-dubstep"),
        Song(name: "tomorrow", artist: "Taylor Swift", image: "tomorrow", audio: "bensound-tomorrow"),
        Song(name: "Ukelele", artist: "Taylor Swift", image: "ukulele", audio: "bensound-ukulele"),
        Song(name: "Happy Rock", artist: "Taylor Swift", image: "happyrock", audio: "bensound-happyrock", isBehind: false)
    ]
}
