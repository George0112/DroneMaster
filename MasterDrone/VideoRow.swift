//
//  VideoRow.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI

struct VideoRow: View {
    
    var video: Video
    
    var body: some View {
        HStack{
            video.image
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
//            Text(video.id)
//            Text(video.url)
            Text(video.timestamp)
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
