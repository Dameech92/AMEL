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
                             .font(.title)
                             .padding()
                     }
                     Spacer()
                     VStack {
                         Text("Heading:")
                            .font(.title)
                         Text("\(headingVM.getMagHeading())")
                            .font(.title)
                     }
                     Spacer()
                 }
                HStack{
                 VStack{
                    ButtonView(name: "Bomb")
                    Spacer()
                     ButtonView(name: "Missile")
                     Spacer()
                     ButtonView(name: "Navigation")
                     Spacer()
                    
                     }
                         
                    VStack{
                    ButtonView(name: "NUKE EM!")
                         Spacer()
                        ButtonView(name: "Jammer")
                         Spacer()
                         ButtonView(name: "Custom")
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
