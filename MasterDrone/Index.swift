//
//  Index.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/6/13.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI

struct Index: View {
    
    @EnvironmentObject private var userData: UserData
//    @State var routeIsPresented: Bool = false
//    @State var spotIsPresented: Bool = false
    @State var video_url = stream_url
    @State var playerOpacity:Double = 0.0
    @State var videoIndex = 0
    
    var body: some View {
        ZStack{
            VStack{
                if(userData.page == CurrentPage.index){
                    ZStack{
                        Stream(video_url: stream_url)
                            .frame(height: 180)
                            .blur(radius: 10)
                        Button(action: {
                            self.userData.page = CurrentPage.stream
                            self.video_url = stream_url
                            self.playerOpacity = 1.0
                        }){
                            Text("Video Streaming")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .frame(width: UIScreen.screenWidth, height: 180)
                        }
                        .frame(height: 180.0)
                    }
                    Spacer()
                    HStack{
                        Button(action:{
                            self.userData.page = CurrentPage.spot
                        }){
                            Text("Go to a spot")
                                .foregroundColor(Color.white)
                                .padding()
                                .cornerRadius(25)
                                .background(Color.blue)
                        }
                        .cornerRadius(8)
    //
                        Button(action:{
                            self.userData.page = CurrentPage.route
                        }){
                            Text("Define my route")
                                .foregroundColor(Color.white)
                                .padding()
                                .cornerRadius(25)
                                .background(Color.blue)
                        }
                        .cornerRadius(8)
                    }
            
                    VideoList(index: $videoIndex)
                    Spacer()
            
                }
                else if(self.userData.page == CurrentPage.spot){
                    Spot()
                }
                else if(self.userData.page == CurrentPage.route){
                    Route()
                }
                else if (self.userData.page == CurrentPage.stream){
                    Stream(video_url: stream_url)
                }
                else if(self.userData.page == CurrentPage.video){
                    Stream(video_url: userData.videos[videoIndex].video_url)
                }
            }
//            VStack{
//                Stream(video_url: stream_url)
//                .opacity(playerOpacity)
//            }
//            .background(Color.white)
//            .opacity(playerOpacity)
        }
    }
}

struct Index_Previews: PreviewProvider {
    static var previews: some View {
        Index()
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
