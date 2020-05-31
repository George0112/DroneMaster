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
    
    var body: some View {
        HStack{
            NavigationView{
                List{
                    Button(action: {
                        print(self.userData.videos)
                        
                    }){
                        Text("print")
                    }
                    Button(action: {
                        AF.request(
                            "https://gbdm4rp3kk.execute-api.us-east-1.amazonaws.com/stable/takeoff",
                            method: .post)
                            .responseString{ response in
                        }
                    }) {
                        HStack{
                            Spacer()
                            Text("Take Off")
                                .font(.headline)
                                .frame(height: 30)
                                .buttonStyle(/*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Button Style@*/DefaultButtonStyle()/*@END_MENU_TOKEN@*/)
                            Image(systemName: "airplane")
                            Spacer()
                        }
                    }
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
            .onAppear{
                AF.request("https://e7x111rdwe.execute-api.us-east-1.amazonaws.com/stable")
                    .responseDecodable(of: [Video].self){ response in
                //        debugPrint(response)
                        self.userData.videos = response.value!
                }
                print(videoData)
            }
        }
    }
}

struct VideoList_Previews: PreviewProvider {
    static var previews: some View {
        VideoList().environmentObject(UserData())
    }
}
