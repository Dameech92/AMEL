//
//  ButtonView.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct RecordView: View {
        private let locationVM = LocationViewModel()
        private let headingVM = HeadingViewModel()
        @ObservedObject private var locationManager = LocationManager()
        @Environment(\.managedObjectContext) var managedObjectContext
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
                    ButtonView(name: "Bomb", color: Color.blue)
                    Spacer()
                    ButtonView(name: "Missile", color: Color.green)
                     Spacer()
                    ButtonView(name: "Radar Jam", color: Color.red)
                     Spacer()
                     }
                         
                    VStack{
                        ButtonView(name: "Custom 1", color: Color.purple)
                         Spacer()
                        ButtonView(name: "Custom 2", color: Color.yellow)
                         Spacer()
                        ButtonView(name: "Custom 3", color: Color.orange)
                         Spacer()
                             
                     }
                 }
             }
             .padding(10.0)
          }
        }
    }

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
