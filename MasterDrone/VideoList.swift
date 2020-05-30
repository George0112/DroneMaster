//
//  VideoList.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI

struct VideoList: View {
    
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        HStack{
            NavigationView{
                List{
                    ForEach(userData.videos){ video in
                        NavigationLink(
                            destination: ObjectList(objects: video.objects)
                        ){
                            VideoRow(video: video)
                        }
                    }
                }
                .navigationBarTitle(Text("Videos"))
            .statusBar(hidden: true)
            }
        }
    }
}

struct VideoList_Previews: PreviewProvider {
    static var previews: some View {
        VideoList().environmentObject(UserData())
    }
}
