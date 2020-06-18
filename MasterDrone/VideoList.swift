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
//        ZStack{
//            NavigationView{
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
//            }
            .onAppear{
                AF.request(api_url)
                    .responseDecodable(of: [Video].self){ response in
                        debugPrint(response)
                        self.userData.videos = response.value!
                }
            }
//            VStack{
//                HStack{
//                    Spacer()
//                    Button(action: {
//                        AF.request(api_url)
//                            .responseDecodable(of: [Video].self){ response in
//                                debugPrint(response)
//                                self.userData.videos = response.value!
//                                self.userData.videos = self.userData.videos.sorted{
//                                    $0.id < $1.id
//                                }
//                        }
//                    }){
//                        Image(systemName: "goforward")
//                            .resizable()
//                            .frame(width: 40, height: 40)
//                    }
//                }
//                .padding()
//                Spacer()
//            }
//            .padding(.top, 30.0)
//        }
//        .alert(isPresented: self.$showAlert){
//            Alert(title: Text("Taking Off"))
//        }
    }
}

//struct VideoList_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoList().environmentObject(UserData())
//    }
//}
