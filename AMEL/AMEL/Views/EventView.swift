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
                 HStack{
                    EventTitleBackground(name: viewModel.getName(), color: viewModel.getColor())
                    Spacer()
                    DataTextColumn(dataList: colOne)
                    Spacer()
                    DataTextColumn(dataList: colTwo)
                    Spacer()
                }
                .lineLimit(2)
                Rectangle()
                    .stroke(Color("stealth"), lineWidth: 5)
           }
           .background(Color("buttonBackGround"))
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        return EventView(event: Event())
    }
}
