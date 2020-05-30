//
//  ObjectDetail.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI
import CoreLocation

let screenWidth: CGFloat = UIScreen.main.bounds.width
struct ObjectDetail: View {
    
    @State var screen = UIScreen.main.bounds.width
//    @State var
    
    
    var object: Object
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                VStack(spacing: 15){
                    Spacer()
                    // pin on 24.7959179,120.9899573,
        //            MapView(coordinate: CLLocationCoordinate2D(latitude: 24.7959179, longitude: 120.9899573))
        //                .edgesIgnoringSafeArea(.top)
        //                .frame(height: 300)
                    object.image
                        .resizable()
                        .frame(height: 300)
        //                .offset(y: -130)
        //                .padding(.bottom, -130)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 8))
                        .shadow(color: Color.white, radius: 20, x: 0, y: 0)
                    Spacer()
                    HStack {
                        Text("ID: ")
                        Spacer()
                        Text(object.id)
                    }
                    .padding()
                    HStack {
                        Text("Filename: ")
                        Spacer()
                        Text(object.imageName)
                    }
                    .padding()
                    HStack {
                        Text("Position: ")
                        Spacer()
                        Text(object.location)
                    }
                    .padding()
                    NavigationLink(
                        destination:
                        MapView(coordinate: CLLocationCoordinate2D(latitude: 24.7959179, longitude: 120.9899573))
                                            .edgesIgnoringSafeArea(.top)
                                            .frame(height: 300)
                    ){
                        Text("Map")
                    }
                    Spacer()
                }
//                 pin on 24.7959179,120.9899573,
               
//
            }
        }
        .padding()
        
//        .frame(width: screenWidth * 2)
////        .padding(.all, screenWidth)
//            .offset(x: 0.5 * screenWidth, y:0)
    }
}


struct ObjectDetail_Previews: PreviewProvider {
    static var previews: some View {
        ObjectDetail(object: videoData[0].objects[0])
    }
}
