//
//  VideoRow.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI
import URLImage
import Alamofire

struct VideoRow: View {

    @EnvironmentObject private var userData: UserData

    var video: Video
//    var url: URL = URL(string: video.objects[0].img_url ?? "")!
    var body: some View {
        HStack{
//            URLImage((URL(string: video.objects[0].img_url)! ?? URL(string: ""))!){proxy in
//                proxy.image
//                .resizable()
//                .frame(width: 50, height: 50)
//            }
//            video.image
//                .resizable()
//                .frame(width: 50, height: 50)
//            Spacer()
//            Button(action:{
//                self.userData.page = CurrentPage.video
//            }){

//            }
//            .frame(width: UIScreen.screenWidth)
            Text(video.id)
            Spacer()
            Image(systemName: "chevron.right")
//            Text(video.url)
//            Text(video.timestamp)
//            Text(video.objects[0].location)
        }
    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            VideoRow(video: videoData[0])
            VideoRow(video: videoData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
