//
//  EventView.swift
//  logLocation
//
//  Created by Neil Marcellini on 2/25/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct EventView: View{
    let event: Event
    @Environment(\.verticalSizeClass) var heightSizeClass
    @Environment(\.horizontalSizeClass) var widthSizeClass
    var body: some View {
        let viewModel = EventViewModel(event: event)
        let colOne = [viewModel.getTime(), viewModel.getLatLng(), viewModel.getAltitude(), viewModel.getBoBR(), viewModel.getHeadingCourse(), viewModel.getGroundSpeed()]
        let smallText = heightSizeClass == .compact || widthSizeClass == .compact
           return ZStack {
                VStack{
                    EventTitleBackground(name: viewModel.getName(), color: event.color, smallText: smallText)
                        .layoutPriority(0.5)
                    if widthSizeClass == .compact {
                        VStack {
                            ForEach(0 ..< colOne.count){
                                Text(colOne[$0])
                            }
                        }.layoutPriority(1)
                            .padding(.bottom, 5)
                    } else {
                        HStack{
                            Spacer()
                            VStack(alignment: .leading) {
                                Spacer()
                                ForEach(0 ..< colOne.count/2){
                                    Text(colOne[$0])
                                    Spacer()
                                }
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Spacer()
                                Spacer()
                                ForEach(colOne.count/2 ..< colOne.count){
                                    Text(colOne[$0])
                                    Spacer()
                                }
                            }
                            Spacer()
                        }
                        .layoutPriority(1)
                    }
                    

                }.font(smallText ? .body : .title)
            .lineLimit(2)
            Rectangle()
                .stroke(Color("StealthText"), lineWidth: 5)
           }
           .background(Color("buttonBackGround"))
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        return EventView(event: Event())
    }
}
