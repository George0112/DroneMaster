//
//  Route.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/6/13.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI
import ASCollectionView
import Alamofire

struct Route: View {
    
    @EnvironmentObject private var userData: UserData
    @State private var sheetPresented: Bool = false
    @State private var alertPresented: Bool = false
    @State private var stepAlertPresented: Bool = false
    @State var type = 0
    @State var distance = 0
    @State var degree = 0
    @State var height = 0
    
    let types: [String] = ["forward", "back", "cw", "ccw", "up", "down"]
    let aliases: [String] = ["forward", "back", "right", "left", "rise", "decline"]
    let distances: [String] = ["100", "200", "300", "400", "500"]
    let degrees: [String] = ["90", "180", "270"]
    let heights: [String] = ["50", "100", "150", "200"]
    
    var body: some View {
        ZStack{
            VStack{
                Text("Route Builder")
                ASCollectionView(data: self.userData.routes, dataID: \.self) { item, _ in
                    RouteStep(step: item)
                    }
                .layout {
                    .grid(layoutMode: .adaptive(withMinItemSize: 100),
                          itemSpacing: 5,
                          lineSpacing: 25,
                          itemSize: .absolute(UIScreen.screenWidth*0.295))
                }
                ZStack{
                    Button(action: {
                        self.alertPresented = true
                    }){
                        Text("Start Flying")
                        .foregroundColor(Color.white)
                        .padding()
                        .cornerRadius(25)
                        .background(Color.blue)
                    }
                    .cornerRadius(25)
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.sheetPresented = true
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
        .sheet(isPresented: self.$sheetPresented){
            ZStack{
                Color(#colorLiteral(red: 0.709623158, green: 0.9242145419, blue: 0.9317752719, alpha: 1))
                VStack{
                    Text("Route Builder")
                        .font(.headline)
                        .fontWeight(.heavy)
                    
                    Picker(selection: self.$type, label: Text("")){
                        ForEach(0..<self.aliases.count){i in
                            Text(self.aliases[i]).tag(i)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if(self.type == 0 || self.type == 1){
                        Picker(selection: self.$distance, label:Text("")){
                            ForEach(0..<self.distances.count){i in
                                Text(self.distances[i]).tag(i)
                            }
                        }.labelsHidden()
                    }
                    else if(self.type == 2 || self.type == 3){
                        Picker(selection: self.$degree, label:Text("")){
                            ForEach(0..<self.degrees.count){i in
                                Text(self.degrees[i]).tag(i)
                            }
                        }.labelsHidden()
                    }
                    else if(self.type == 4 || self.type == 5){
                        Picker(selection: self.$height, label:Text("")){
                            ForEach(0..<self.heights.count){i in
                                Text(self.heights[i]).tag(i)
                            }
                        }.labelsHidden()
                    }
                    
                    Button(action: {
                        print(self.type)
                        print(self.distance)
                        if(self.type == 0 || self.type == 1){
                            self.userData.routes.insert(
                                route(
                                    id: self.userData.count,
                                    cmd: (self.types[self.type]+" "+self.distances[self.distance]),
                                    alias: self.aliases[self.type]+" "+self.distances[self.distance]
                                ),
                            at: self.userData.routes.count-1)
                        }
                        else if(self.type == 2 || self.type == 3){
                            self.userData.routes.insert(
                                route(
                                    id: self.userData.count,
                                    cmd: (self.types[self.type]+" "+self.degrees[self.degree]),
                                    alias: self.aliases[self.type]+" "+self.degrees[self.degree]
                                ),
                            at: self.userData.routes.count-1)
                        }
                        else if(self.type == 4 || self.type == 5){
                            self.userData.routes.insert(
                                route(
                                    id: self.userData.count,
                                    cmd: (self.types[self.type]+" "+self.heights[self.height]),
                                    alias: self.aliases[self.type]+" "+self.heights[self.height]
                            ),
                            at: self.userData.routes.count-1)
                        }
                        self.userData.count += 1
                        self.sheetPresented = false
                        print(self.userData.routes)
                    }){
                        Text("Done")
                        .foregroundColor(Color.white)
                        .padding()
                        .cornerRadius(25)
                        .background(Color.blue)
                    }
                    .background(Color.blue)
                    .cornerRadius(25)
                }
            }
        }
        .alert(isPresented: self.$alertPresented){
            Alert(
                title: Text("Start Flying"),
                message: Text("You are about to fly the followint route"),
                primaryButton: .default(Text("Start")){
                    self.userData.page = CurrentPage.stream
                    var commands: [String] = []
                    for r in self.userData.routes{
                        commands.append(r.cmd)
                    }
                    let parameters: [String: [String]] = [
                        "mode": ["route"],
                        "location": [],
                        "route": commands
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
                }, secondaryButton: .destructive(Text("Cancel"))
            )
        }
    }
    
}

struct Route_Previews: PreviewProvider {
    static var previews: some View {
        Route()
    }
}
