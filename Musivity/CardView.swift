//
//  CardView.swift
//  Musivity
//
//  Created by Tillie Ferguson on 1/11/22.
//  Based on tutorial created by Gary Tokman on 2/15/21.
//

import SwiftUI

struct CardView: View {
    let proxy: GeometryProxy
    @GestureState var translation: CGSize = .zero
    @GestureState var degrees: Double = 0
    @GestureState var isDragging: Bool = false
    
    let threshold: CGFloat = 0.5
    let song: Song
    let index: Int
    let onRemove: ((Int) -> Void)?
    
    var body: some View {
        let dragGesture = DragGesture()
            .updating($translation) { (value, state, _) in
                state = value.translation
            }
            .updating($degrees) { (value, state, _) in
                state = value.translation.width > 0 ? 2 : -2
            }
            .updating($isDragging) { (value, state, _) in
                state = value.translation.width != 0
            }
            .onEnded { (value) in
                let dragPercentage = value.translation.width / proxy.size.width
                if abs(dragPercentage) > threshold {
                    //remove card
                    onRemove?(index)
                }
            }
        
        

        Rectangle()
            .overlay(
                GeometryReader { proxy in
                    ZStack {
                        Image(song.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                        VStack(alignment: .leading) {
                            Text(song.name)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text(song.artist)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        
                        }
                        .position(
                            x: proxy.frame(in: .local).minX + 75,
                            y: proxy.frame(in: .local).maxY - 50
                        )
                        Image("face-sad-cry")
                            .opacity(degrees < 0 ? 1 : 0)
                            .frame(width: 50, height: 50)
                            .position(
                                x: proxy.size.width/2,
                                y: proxy.frame(in: .local).midY
                            )
                            .scaleEffect(isDragging ? 0.2 : 0.1)
                            .animation(.default)
                        /*Rectangle()
                            .overlay(Image("face-sad-cry"))
                            .foregroundColor(.red)
                            .opacity(degrees < 0 ? 1 : 0)
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                            .position(
                                x: proxy.frame(in:
                                .local).midX + 75,
                                y: proxy.frame(in: .local).midY
                            )
                            .scaleEffect(isDragging ? 2 : 1)
                            .animation(.default)*/
                        
                        Image("face-grin-beam")
                            .opacity(degrees > 0 ? 1 : 0)
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                            .position(
                                x: proxy.size.width/2,
                                y: proxy.frame(in: .local).midY
                            )
                            .scaleEffect(isDragging ? 0.2 : 0.1)
                            .animation(.default)
                    }
                }
            )
            .cornerRadius(10)
            .frame(
                maxWidth: proxy.size.width - 28,
                maxHeight: proxy.size.height * 0.8
            )
            .position(
                x: proxy.frame(in: .global).midX,
                y: proxy.frame(in: .local).midY - 30
            )
            .offset(x: translation.width, y: 0)
            .rotationEffect(.degrees(degrees))
            .scaleEffect(song.isBehind ? 0.9 : 1)
            .onAppear{
                if !song.isBehind {
                    MusicPlayer.shared.startBackgroundMusic(filename: song.audio)
                }
            }
            .gesture(dragGesture)
            .animation(.interactiveSpring())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            CardView(proxy: proxy, song: Song.songs[0], index: 0, onRemove: nil)
        }
    }
}
