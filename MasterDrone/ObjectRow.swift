//
//  ObjectRow.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/5/30.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI

struct ObjectRow: View {
    
    var object: Object
    
    var body: some View {
        HStack{
//            Text(object.location)
            Text(object.object)
        }
    }
}

struct ObjectRow_Previews: PreviewProvider {
    static var previews: some View {
        ObjectRow(object: videoData[0].objects[0])
    }
}
