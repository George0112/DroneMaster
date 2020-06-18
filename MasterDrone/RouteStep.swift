//
//  RouteStep.swift
//  MasterDrone
//
//  Created by 陳昭文 on 2020/6/13.
//  Copyright © 2020 chaowen. All rights reserved.
//

import SwiftUI

struct RouteStep: View {
    
    var step: route
    
    let scale: CGFloat = 0.295
    @EnvironmentObject private var userData: UserData
    @State private var stepAlertPresented = false
    
    var body: some View {
        VStack{
            if(step.alias == "takeoff"){
                ZStack{
                    VStack{
                        Image(systemName: "chevron.left.2")
                            .resizable()
                            .rotationEffect(Angle(degrees: 90))
                            .padding()
                            .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                        Text("TakeOff")
                    }
                }
            }
            else if(step.alias == "land"){
                ZStack{
                    VStack{
                        Image(systemName: "chevron.right.2")
                            .resizable()
                            .rotationEffect(Angle(degrees: 90))
                            .padding()
                            .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                        Text("Landing")
                    }
                }
            }
            else if(step.alias.contains("forward")){
                ZStack{
                    VStack{
                        Image(systemName: "arrow.up")
                            .resizable()
                            .padding()
                            .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                        Text(step.alias.capitalizingFirstLetter())
                    }
                    Button(action: {self.stepAlertPresented = true}){
                        Text("")
                        .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    }
                    .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    .alert(isPresented: self.$stepAlertPresented){
                        Alert(
                            title: Text("Delete"),
                            message: Text("Do you want to delete this step?"),
                            primaryButton: .default(Text("Delete")){
                                print(self.step.id)
                                self.userData.routes.removeAll(where: {$0.id == self.step.id})
                            },secondaryButton: .cancel()
                        )
                    }
                }
            }
            else if(step.alias.contains("back")){
                ZStack{
                    VStack{
                        Image(systemName: "arrow.down")
                            .resizable()
                            .padding()
                            .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                        Text(step.alias.capitalizingFirstLetter())
                    }
                    Button(action: {self.stepAlertPresented = true}){
                        Text("")
                        .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    }
                    .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    .alert(isPresented: self.$stepAlertPresented){
                        Alert(
                            title: Text("Delete"),
                            message: Text("Do you want to delete this step?"),
                            primaryButton: .default(Text("Delete")){
                                print(self.step.id)
                                self.userData.routes.removeAll(where: {$0.id == self.step.id})
                            },secondaryButton: .cancel()
                        )
                    }
                }
            }
            else if(step.alias.contains("right")){
                ZStack{
                    VStack{
                        Image(systemName: "arrowshape.turn.up.right")
                            .resizable()
                            .padding()
                            .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                        Text("Turn "+step.alias)
                    }
                    Button(action: {self.stepAlertPresented = true}){
                        Text("")
                        .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    }
                    .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    .alert(isPresented: self.$stepAlertPresented){
                        Alert(
                            title: Text("Delete"),
                            message: Text("Do you want to delete this step?"),
                            primaryButton: .default(Text("Delete")){
                                print(self.step.id)
                                self.userData.routes.removeAll(where: {$0.id == self.step.id})
                            },secondaryButton: .cancel()
                        )
                    }
                }
            }
            else if(step.alias.contains("left")){
                ZStack{
                    VStack{
                        Image(systemName: "arrowshape.turn.up.left")
                            .resizable()
                            .padding()
                            .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                        Text("Turn "+step.alias)
                    }
                    Button(action: {self.stepAlertPresented = true}){
                        Text("")
                        .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    }
                    .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    .alert(isPresented: self.$stepAlertPresented){
                        Alert(
                            title: Text("Delete"),
                            message: Text("Do you want to delete this step?"),
                            primaryButton: .default(Text("Delete")){
                                print(self.step.id)
                                self.userData.routes.removeAll(where: {$0.id == self.step.id})
                            },secondaryButton: .cancel()
                        )
                    }
                }
            }
            else if(step.alias.contains("rise")){
                ZStack{
                    VStack{
                        Image(systemName: "chevron.up.circle.fill")
                            .resizable()
                            .padding()
                            .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                        Text(step.alias.capitalizingFirstLetter())
                    }
                    Button(action: {self.stepAlertPresented = true}){
                        Text("")
                        .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    }
                    .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    .alert(isPresented: self.$stepAlertPresented){
                        Alert(
                            title: Text("Delete"),
                            message: Text("Do you want to delete this step?"),
                            primaryButton: .default(Text("Delete")){
                                print(self.step.id)
                                self.userData.routes.removeAll(where: {$0.id == self.step.id})
                            },secondaryButton: .cancel()
                        )
                    }
                }
            }
            else if(step.alias.contains("decline")){
                ZStack{
                    VStack{
                        Image(systemName: "chevron.down.circle.fill")
                            .resizable()
                            .padding()
                            .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                        Text(step.alias.capitalizingFirstLetter())
                    }
                    Button(action: {self.stepAlertPresented = true}){
                        Text("")
                        .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    }
                    .frame(width: UIScreen.screenWidth*scale, height: UIScreen.screenWidth*scale)
                    .alert(isPresented: self.$stepAlertPresented){
                        Alert(
                            title: Text("Delete"),
                            message: Text("Do you want to delete this step?"),
                            primaryButton: .default(Text("Delete")){
                                print(self.step.id)
                                self.userData.routes.removeAll(where: {$0.id == self.step.id})
                            },secondaryButton: .cancel()
                        )
                    }
                }
            }
        }
    }
}

//struct RouteStep_Previews: PreviewProvider {
//    static var previews: some View {
//        RouteStep(step: "takeoff")
//    }
//}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
