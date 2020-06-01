//
//  ObjectList.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI

struct ObjectList: View {
    
    var objects: [Object]
    
    var body: some View {
        VStack{
//            NavigationView{
                List{
                    ForEach(objects){object in
                        NavigationLink(
                            destination: ObjectDetail(object: object)
                        ){
                            ObjectRow(object: object)
                                .frame(height: 50)
                        }
                    }
                }
                .navigationBarTitle(Text("Objects"))
//            }
        }
        .padding(.top, 0.0)
    }
}

struct ObjectList_Previews: PreviewProvider {
    static var previews: some View {
        ObjectList(objects: videoData[0].objects)
    }
}
