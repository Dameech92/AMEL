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
        let viewModel = EventFormatter(event: event)
           return ZStack{
                HStack{
                    EventTitleBackground(name: viewModel.getName(), color: viewModel.getColor())
                    Spacer()
                    VStack(alignment: .leading){
                        Spacer()
                        Text(viewModel.getTime())

                        Spacer()
                        Text(viewModel.getLatLng())

                        Spacer()

                        Text(viewModel.getAltitude())

                        Spacer()

                    }
                    .padding()
                    Spacer()
                    VStack(alignment: .leading){
                        Spacer()
                        Text(viewModel.getBoBR())

                        Spacer()
                        Text(viewModel.getHeadingCourse())

                        Spacer()
                        Text(viewModel.getGroundSpeed())

                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                .font(.title)
                Rectangle()
                .stroke(Color.black, lineWidth: 5)
           }
           .background(Color("buttonBackGround"))
        }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        return EventView(event: Event())
    }
}
