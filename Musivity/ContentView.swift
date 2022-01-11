//
//  ContentView.swift
//  Musivity
//
//  Created by Tillie Ferguson on 1/11/22.
//  Based on tutorial created by Gary Tokman on 2/15/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var songs = Song.songs
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        print("in body")
        return GeometryReader { proxy in
            ZStack {
                ForEach(Array(songs.enumerated()), id:
                            \.offset) { index, song in
                    CardView(
                        proxy: proxy,
                        song: song,
                        index: index
                    ) { (index) in
                        songs.remove(at: index)
                        if index > 0 {
                            songs[index - 1].isBehind = false
                        }
                    }
                        
                }
                Button("reload", action:{
                    songs.append(contentsOf: Song.songs)
                }).position(x: proxy.frame(in: .local).midX)
                    .onAppear {
                        MusicPlayer.shared.startBackgroundMusic(filename: "bensound-happyrock")
                        let sound = Bundle.main.path(forResource: "bensound-happyrock", ofType: "mp3")
                                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        print("hello")
                    }
                        //MusicPlayer.shared.startBackgroundMusic(filename: "bensound-happyrock")
                    

            }
                        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
