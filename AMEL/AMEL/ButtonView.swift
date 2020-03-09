//
//  ButtonView.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject private var locationManager = LocationManager()
        @Environment(\.managedObjectContext) var managedObjectContext
        private let locationVM = LocationViewModel()
        private let headingVM = HeadingViewModel()
        var body: some View {
        ZStack{
             Color("stealth").edgesIgnoringSafeArea(.all)
             VStack{
                 HStack{
                     Spacer()
                     VStack{
                         Text("Lat/Long/Alt")
                            .font(.largeTitle)
                         Text("\(locationVM.getLatitude())/\(locationVM.getLongitude())/\(locationVM.getAltitude())")
                     }
                     Spacer()
                     VStack {
                         Text("Heading:")
                         Text("\(headingVM.getMagHeading())")
                     }
                     Spacer()
                 }
             HStack{
                 VStack{
                 
                     Button(action: {ButtonAction.record("Fire", self.locationManager, self.managedObjectContext)}) {
                         Text("FIRE!")
                         .frame(minWidth: 0, maxWidth: .infinity)
                         .frame(minHeight: 0, maxHeight: .infinity)
                         .font(.largeTitle)
                         .padding()
                         .foregroundColor(.primary)
                         .background(Color("buttonBackGround"))
                         .cornerRadius(40)
                         //.padding(20)
                         .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray,lineWidth: 6))
                         
                     }
                         Spacer()
                     
                     Button(action: {ButtonAction.record("Radar!", self.locationManager, self.managedObjectContext)}){
                             Text("Radar!")
                             .frame(minWidth: 0, maxWidth: .infinity)
                             .frame(minHeight: 0, maxHeight: .infinity)
                             .font(.largeTitle)
                             .padding()
                             .foregroundColor(.primary)
                             .background(Color("buttonBackGround"))
                             .cornerRadius(40)
                             .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray,lineWidth: 6))
                             
                     }
                         Spacer()
                     
                     Button(action: {ButtonAction.record("BOMB", self.locationManager, self.managedObjectContext)}){
                         Text("BOMB!")
                         .frame(minWidth: 0, maxWidth: .infinity)
                         .frame(minHeight: 0, maxHeight: .infinity)
                         .font(.largeTitle)
                         .padding()
                         .foregroundColor(.primary)
                         .background(Color("buttonBackGround"))
                         .cornerRadius(40)
                         .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray,lineWidth: 6))
                         }
                     Spacer()
                         
                 }
                 
                 VStack{
                     
                         Button(action: {ButtonAction.record("NUKE EM!", self.locationManager, self.managedObjectContext)}){
                             Text("NUKE EM!")
                             .frame(minWidth: 0, maxWidth: .infinity)
                             .frame(minHeight: 0, maxHeight: .infinity)
                             .font(.largeTitle)
                             .padding()
                             .foregroundColor(.primary)
                             .background(Color("buttonBackGround"))
                             .cornerRadius(40)
                             .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray,lineWidth: 6))
                         }
                         Spacer()
                 
                         Button(action: {ButtonAction.record("JAMMER!", self.locationManager, self.managedObjectContext)}){
                             Text("JAMMER!")
                             .frame(minWidth: 0, maxWidth: .infinity)
                             .frame(minHeight: 0, maxHeight: .infinity)
                             .font(.largeTitle)
                             .padding()
                             .foregroundColor(.primary)
                             .background(Color("buttonBackGround"))
                             .cornerRadius(40)
                             .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray,lineWidth: 6))
                         }
                         Spacer()
                         
                         Button(action: {ButtonAction.record("SETTINGS!", self.locationManager, self.managedObjectContext)}){
                             Text("SETTINGS!")
                             .frame(minWidth: 0, maxWidth: .infinity)
                             .frame(minHeight: 0, maxHeight: .infinity)
                             .font(.largeTitle)
                             .padding()
                             .foregroundColor(.primary)
                             .background(Color("buttonBackGround"))
                             .cornerRadius(40)
                             .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.gray,lineWidth: 6))
                         }
                         Spacer()
                             
                     }
             }
             .padding(10.0)
          }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
