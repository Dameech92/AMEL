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
    @ObservedObject var popups: PopupCreator
    let logIndex: Int
    let startPopupIndex = 4
    var body: some View {
        let viewModel = EventViewModel(event: event)
        let smallText = heightSizeClass == .compact || widthSizeClass == .compact
           return ZStack {
                VStack{
                    EventTitleBackground(name: viewModel.getName(), color: event.color, smallText: smallText)
                        .layoutPriority(0.5)
                    if widthSizeClass == .compact {
                        VStack {
                            if(self.popups.index == 4 && logIndex == 0){
                               GenericPopup(text: "Date and time UTC", symbolName: "arrow.down")
                            }
                            Text(viewModel.getTime())
                            if(self.popups.index == 5 && logIndex == 0){
                               GenericPopup(text: "Latidude and Longitude in format:\nDegrees-Minutes.m where m = 1/10 Minute", symbolName: "arrow.down")
                            }
                            Text(viewModel.getLatLng())
                            if(self.popups.index == 6 && logIndex == 0){
                               GenericPopup(text: "Altitude in feet above mean sea level (MSL)", symbolName: "arrow.down")
                            }
                            Text(viewModel.getAltitude())
                            if(self.popups.index == 7 && logIndex == 0){
                               GenericPopup(text: "Distance in nautical miles / heading to the active reference point", symbolName: "arrow.down")
                            }
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
                                if(self.popups.index == 4 && logIndex == 0){
                                   GenericPopup(text: "Date and time UTC", symbolName: "arrow.down")
                                }
                                Text(viewModel.getTime())
                                Spacer()
                                if(self.popups.index == 5 && logIndex == 0){
                                   GenericPopup(text: "Latidude and Longitude in format:\nDegrees-Minutes.m where m = 1/10 Minute", symbolName: "arrow.down")
                                }
                                Text(viewModel.getLatLng())
                                Spacer()
                                if(self.popups.index == 6 && logIndex == 0){
                                   GenericPopup(text: "Altitude in feet above mean sea level (MSL)", symbolName: "arrow.down")
                                }
                                Text(viewModel.getAltitude())
                                Spacer()
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Spacer()
                                if(self.popups.index == 7 && logIndex == 0){
                                   GenericPopup(text: "Distance in nautical miles / heading to the active reference point", symbolName: "arrow.down")
                                }
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
        return EventView(event: Event(), popups: PopupCreator(length: 5, showingTutorial: false), logIndex: 0)
    }
}
