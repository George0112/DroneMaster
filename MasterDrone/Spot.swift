//
//  Spot.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/6/13.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit
import URLImage
import Alamofire

struct Spot: View {
    
    @EnvironmentObject private var userData: UserData
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var annotation = MKPointAnnotation()
    @State private var alertIsPresented: Bool = false
    @State private var confirmAlertPresented: Bool = false
    @GestureState private var dragOffset = CGSize.zero

    var body: some View {
        ZStack(){
            ZStack {
                SpotMapView(centerCoordinate: $centerCoordinate,
                            annotation: $annotation,
                            coordinate: location)
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            // create a new location
                            let newLocation = MKPointAnnotation()
                            newLocation.coordinate = self.centerCoordinate
                            self.userData.destination = self.centerCoordinate
                            self.annotation = newLocation
                            print(self.annotation.coordinate)
                        }) {
                            Image(systemName: "plus")
                            .resizable()
                            .frame(width: 35, height: 35)
                        }
                        .padding()
                        .background(Color.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                        .alert(isPresented: self.$confirmAlertPresented){
                            Alert(
                                title: Text("Start Flying"),
                                message: Text("You are about to fly to chosen spot"),
                                primaryButton: .default(Text("Start")){
                                    var h = CLLocation(latitude: location.latitude, longitude: self.annotation.coordinate.longitude)
                                    var v = CLLocation(latitude: self.annotation.coordinate.latitude, longitude: location.longitude)
                                    var o = CLLocation(latitude: location.latitude, longitude: location.longitude)
                                    var h_meter = o.distance(from: h)
                                    var v_meter = o.distance(from: v)
                                    if(self.annotation.coordinate.longitude < location.longitude){h_meter = -1*h_meter}
                                    if(self.annotation.coordinate.latitude < location.latitude){v_meter = -1*v_meter}
                                    print(h_meter, v_meter)
                                    let parameters: [String: [String]] = [
                                        "mode": ["location"],
                                        "location": [String(h_meter), String(v_meter)],
                                        "route": []
                                    ]
                                    AF.request(
                                        "https://524a4wjpmd.execute-api.ap-northeast-1.amazonaws.com/stable/takeoff", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
                                        .responseString{ response in
                                            print(response.value)
                                    }
                                    
                                    AF.request(
                                        "https://524a4wjpmd.execute-api.ap-northeast-1.amazonaws.com/stable/startreko", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
                                        .responseString{ response in
                                            print(response.value)
                                    }
                                    self.userData.page = CurrentPage.stream
                                }, secondaryButton: .destructive(Text("Cancel"))
                            )
                        }
                    }
                }
                VStack{
                    HStack{
                        Button(action:{self.userData.page = CurrentPage.index}){
                            Image(systemName: "chevron.left")
                            .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
            VStack{
                Spacer()
                Button(action: {
                        print(self.annotation.coordinate)
                        if(self.annotation.coordinate.latitude != 0){
                            self.confirmAlertPresented = true
                        }
                        else{
                            self.alertIsPresented = true
                        }
                    }){
                    Text("Take Off")
                        .font(.headline)
                        .frame(height: 35)
                        .foregroundColor(.white)
                    Image(systemName: "paperplane")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(25)
                .alert(isPresented: self.$alertIsPresented){
                    Alert(title: Text("Please Choose a Spot"))
                }
            }
        }
        .gesture(DragGesture().updating($dragOffset, body:{(value, state, transaction) in
            if(value.startLocation.x < 20 && value.translation.width > 100){
                self.userData.page = CurrentPage.index
            }
        }))
    }
}

struct Spot_Previews: PreviewProvider {
    static var previews: some View {
        Spot()
    }
}
