//
//  Stream.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/6/13.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI
import AVKit


struct Stream: View {
    
    @EnvironmentObject private var userData: UserData
//    @Binding var playerOpacity: Double
    var video_url: String
    
    var body: some View {
        VStack{
            VideoView(videoURL: URL(string: self.video_url)!)

            if(self.userData.page != CurrentPage.index){
                Button(action: {self.userData.page = CurrentPage.index}){
                    Text("Return")
                    .foregroundColor(Color.white)
                    .padding()
                    .cornerRadius(25)
                    .background(Color.blue)
                }
                .cornerRadius(25)
            }
        }
    }
}

struct VideoView: UIViewRepresentable {
    
    var videoURL:URL
    var previewLength:Double?
    
    func makeUIView(context: Context) -> UIView {
        print(videoURL)
        return PlayerView(frame: .zero, url: videoURL, previewLength: previewLength ?? 15)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

class PlayerView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var previewTimer:Timer?
    var previewLength:Double
    
    init(frame: CGRect, url: URL, previewLength:Double) {
        self.previewLength = previewLength
        super.init(frame: frame)
        
        // Create the video player using the URL passed in.
        let player = AVPlayer(url: url)
        player.volume = 0 // Will play audio if you don't set to zero
        player.play() // Set to play once created
        
        // Add the player to our Player Layer
        playerLayer.player = player

        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        self.previewLength = 15
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}


//struct Stream_Previews: PreviewProvider {
//    static var previews: some View {
//        Stream(video_url: "")
//    }
//}

//struct PlayerView: UIViewRepresentable {
//
//      @Binding var video_url: String
//
//      func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
//        uiView.video_url = video_url
//      }
//
//      func makeUIView(context: Context) -> UIView {
//        let uiView = PlayerUIView(frame: .zero)
//        uiView.video_url = video_url
//        return uiView
//      }
//}
//
//class PlayerUIView: UIView {
//  private let playerLayer = AVPlayerLayer()
//    var video_url: String
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        let url = URL(string: video_url)!
//        let player = AVPlayer(url: url)
//    player.play()
//
//    playerLayer.player = player
//    layer.addSublayer(playerLayer)
//  }
//
//  required init?(coder: NSCoder) {
//     fatalError("init(coder:) has not been implemented")
//  }
//
//  override func layoutSubviews() {
//    super.layoutSubviews()
//    playerLayer.frame = bounds
//  }
//}
