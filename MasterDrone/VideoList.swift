//
//  VideoList.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI
import Alamofire
import URLImage

struct VideoList: View {
    
    @EnvironmentObject private var userData: UserData
    @State var showAlert = false
    @Binding var index: Int
    
    var body: some View {
        List{
            ForEach(userData.videos){ video in
                Button(
                    action: {
                        self.index = self.userData.videos.firstIndex(of: video)!
                        print(self.index)
                        self.userData.page = CurrentPage.video
                    }
                ){
                    VideoRow(video: video)
                        .frame(height: 60)
                }
            }
        }
        .navigationBarTitle(Text("Videos"))
        .statusBar(hidden: true)
        .onAppear{
            AF.request(api_url)
                .responseDecodable(of: [Video].self){ response in
                    debugPrint(response)
                    self.userData.videos = response.value!
            }
        }
    }
}
