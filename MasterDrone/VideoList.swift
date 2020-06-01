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
    @State var firstLayer = true
    
    var body: some View {
        ZStack{
            NavigationView{
                List{
                    Button(action: {
                        AF.request(
                            "https://e7x111rdwe.execute-api.us-east-1.amazonaws.com/stable/takeoff",                           method: .post)
                            .responseString{ response in
                                print(response.value)
                        }
                    }) {
                        HStack{
                            Spacer()
                            Text("Take Off")
                                .font(.headline)
                                .frame(height: 30)
                                .buttonStyle(/*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Button Style@*/DefaultButtonStyle()/*@END_MENU_TOKEN@*/)
                            Image(systemName: "paperplane")
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
                        debugPrint(response)
                        self.userData.videos = response.value!
                }
            }
            if firstLayer{
                VStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            AF.request("https://e7x111rdwe.execute-api.us-east-1.amazonaws.com/stable")
                                .responseDecodable(of: [Video].self){ response in
                                    debugPrint(response)
                                    self.userData.videos = response.value!
                                    self.userData.videos = self.userData.videos.sorted{
                                        $0.id < $1.id
                                    }
                            }
                        }){
                            Image(systemName: "goforward")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding()
                    Spacer()
                }
                .padding(.top, 30.0)
            }
        }
    }
}

struct VideoList_Previews: PreviewProvider {
    static var previews: some View {
        VideoList().environmentObject(UserData())
    }
}
