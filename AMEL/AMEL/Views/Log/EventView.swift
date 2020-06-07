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
    var body: some View {
        let viewModel = EventViewModel(event: event)
        let colOne = [viewModel.getTime(), viewModel.getLatLng(), viewModel.getAltitude()]
        let colTwo = [viewModel.getBoBR(), viewModel.getHeadingCourse(), viewModel.getGroundSpeed()]
           return ZStack {
                VStack{
                    EventTitleBackground(name: viewModel.getName(), color: event.color)
                        .layoutPriority(0.5)
                    HStack{
                        Spacer()
                        DataTextColumn(dataList: colOne)
                            .font(.title)
                        Spacer()
                        DataTextColumn(dataList: colTwo)
                            .font(.title)
                        Spacer()
                    }
                    .layoutPriority(1)

               }
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