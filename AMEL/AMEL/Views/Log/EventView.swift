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
        let smallText = heightSizeClass == .compact || widthSizeClass == .compact
           return ZStack {
                VStack{
                    EventTitleBackground(name: viewModel.getName(), color: event.color, smallText: smallText)
                        .layoutPriority(0.5)
                    if widthSizeClass == .compact {
                        VStack {
        
                            Text(viewModel.getTime())
                            
                            Text(viewModel.getLatLng())
                            
                            Text(viewModel.getAltitude())
                            
                            Text(viewModel.getBoBR())
                            Text(viewModel.getHeadingCourse())
                            Text(viewModel.getGroundSpeed())
                        }.layoutPriority(1)
                            .padding(.bottom, 5)
                    } else {
                        HStack{
                            Spacer()
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Text(viewModel.getTime())
                                Spacer()
                                
                                Text(viewModel.getLatLng())
                                Spacer()
                               
                                Text(viewModel.getAltitude())
                                Spacer()
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Spacer()
                                
                                Text(viewModel.getBoBR())
                                Spacer()
                                Text(viewModel.getHeadingCourse())
                                Spacer()
                                Text(viewModel.getGroundSpeed())
                                Spacer()
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
