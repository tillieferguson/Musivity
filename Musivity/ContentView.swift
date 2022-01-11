//
//  ContentView.swift
//  Musivity
//
//  Created by Tillie Ferguson on 1/11/22.
//  Based on tutorial created by Gary Tokman on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var songs = Song.songs
    
    var body: some View {
        GeometryReader { proxy in
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
