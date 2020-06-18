//
//  Video.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import Foundation
import SwiftUI

struct Video: Hashable, Codable, Identifiable{
    var id: String
    var video_url: String
//    var url: String
//    var timestamp: String
//    var thumbnail: String
//    var objects: [Object]
}

//extension Video{
//    var image: Image{
//        ImageStore.shared.image(name: objects[0].img_url)
//    }
//}

//struct Object: Hashable, Codable, Identifiable{
//    var id: String
//    var video_url: String
//    var location: String
//    var object: String
//    var img_url: String
//    var longitude: String
//    var latitude: String
//}

//extension Object{
//    var image: Image{
//        ImageStore.shared.image(name: img_url)
//    }
//}
