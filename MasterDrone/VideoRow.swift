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
    var body: some View {
        HStack{
            Text(video.id)
            Spacer()
            Image(systemName: "chevron.right")
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
