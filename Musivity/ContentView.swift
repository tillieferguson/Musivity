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
        
        GeometryReader { proxy in
            HStack(alignment: .top) {
                Image("brainicon")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            ZStack {
                ForEach(Array(songs.enumerated()), id:
                            \.offset) { index, song in
                    CardView(
                        proxy: proxy,
                        song: song,
                        index: index
                    ) { (index) in
                        songs.remove(at: index)
                        MusicPlayer.shared.stopBackgroundMusic()
                        if index > 0 {
                            songs[index - 1].isBehind = false
                            MusicPlayer.shared.startBackgroundMusic(filename: songs[index - 1].audio)
                        }
                    }
                        
                }
                /*
                 Button("reload", action:{
                    songs.append(contentsOf: Song.songs)
                }).position(x: proxy.frame(in: .local).midX)
                 */

                    

            }
                        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
