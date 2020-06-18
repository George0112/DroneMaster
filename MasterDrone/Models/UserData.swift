//
//  UserData.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire
import MapKit

final class UserData: ObservableObject{
    @Published var videos: [Video] = videoData
    @Published var page: CurrentPage = CurrentPage.index
    @Published var destination: CLLocationCoordinate2D = CLLocationCoordinate2D()
    @Published var command: String = ""
    @Published var routes: [route] = [
        route(id: 0, cmd: "takeoff", alias: "takeoff"),route(id: 1, cmd: "land", alias: "land")]
    @Published var count = 2
}

enum CurrentPage: Int{
    case index
    case stream
    case spot
    case route
    case video
    case videoList
}

struct route: Identifiable,Hashable{
    var id: Int
    var cmd: String
    var alias: String
}

enum routeStep: String{
    case takeoff = "takeoff"
    case landing = "land"
    case forward = "forward"
    case backward = "back"
    case right = "cw 90"
    case left = "ccw 90"
}

enum routeImg: String{
    case takeoff = "chevron.up"
}
