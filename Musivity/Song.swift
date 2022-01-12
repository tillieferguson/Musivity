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
        Song(name: "Going Higher", artist: "Ben Sound", image: "goinghigher", audio: "bensound-goinghigher"),
        Song(name: "tomorrow", artist: "Ben Sound", image: "tomorrow", audio: "bensound-tomorrow"),
        Song(name: "Better Days", artist: "Ben Sound", image: "betterdays", audio: "bensound-betterdays"),
        Song(name: "Beyond The Line", artist: "Ben Sound", image: "beyondtheline", audio: "bensound-beyondtheline"),
        Song(name: "Jazzy French", artist: "Ben Sound", image: "jazzyfrenchy", audio: "bensound-jazzyfrenchy"),
        Song(name: "Little Idea", artist: "Ben Sound", image: "littleidea", audio: "bensound-littleidea"),
        Song(name: "Elevator", artist: "Ben Sound", image: "theelevatorbossanova", audio: "bensound-theelevatorbossanova"),
        Song(name: "Retro Soul", artist: "Ben Sound", image: "retrosoul", audio: "bensound-retrosoul"),
        Song(name: "Sweet", artist: "Ben Sound", image: "sweet", audio: "bensound-sweet"),
        Song(name: "Tenderness", artist: "Ben Sound", image: "tenderness", audio: "bensound-tenderness"),
        Song(name: "Happiness", artist: "Ben Sound", image: "happiness", audio: "bensound-happiness"),
        Song(name: "Hip Jazz", artist: "Ben Sound", image: "hipjazz", audio: "bensound-hipjazz"),
        Song(name: "dubstep", artist: "Ben Sound", image: "dubstep", audio: "bensound-dubstep"),
        Song(name: "Ukelele", artist: "Ben Sound", image: "ukulele", audio: "bensound-ukulele"),
        Song(name: "A New Beginning", artist: "Ben Sound", image: "anewbeginning", audio: "bensound-anewbeginning"),
        Song(name: "Happy Rock", artist: "Ben Sound", image: "happyrock", audio: "bensound-happyrock"),
        Song(name: "Buddy", artist: "Ben Sound", image: "buddy", audio: "bensound-buddy"),
        Song(name: "Sunny", artist: "Ben Sound", image: "sunny", audio: "bensound-sunny"),
        Song(name: "All That", artist: "Ben Sound", image: "allthat", audio: "bensound-allthat"),
        Song(name: "Creative Minds", artist: "Ben Sound", image: "creativeminds", audio: "bensound-creativeminds", isBehind: false)
    ]
}
