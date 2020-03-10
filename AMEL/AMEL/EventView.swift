//
//  EventView.swift
//  logLocation
//
//  Created by Neil Marcellini on 2/25/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct EventView: View{
    
    init(event: EventFormattedForView){
        self.currEvent = event
    }
    
    var currEvent: EventFormattedForView
    var name: String?
    var time: Date?
    var latitude: Double = 0
    var longitude: Double = 0
    var altitude: Double = 0
    
    var body: some View {
        let name = currEvent.getEventName()
        let time = currEvent.getEventTime()
        let truncatedLatitude = currEvent.getLatitude()
        let truncatedLongitude = currEvent.getLongitude()
        let truncatedAltitude = currEvent.getAltitude()
        let heading = currEvent.getHeading()
        let bobrLargeText = currEvent.getBobrLargeText()
        let bobrSmallText = currEvent.getBobrSmallText()
        let groundSpeed = currEvent.getGroundSpeed()

        return ZStack{
                HStack{
                    Text(name)
                        .font(.title)
                        .rotationEffect(Angle(degrees: Double(-90)))
                        .foregroundColor(Color.white)
                        .background(EventTitleBackground())
                    Spacer()
                    VStack(alignment: .leading){
                        Text(time)
                            .font(.title)
                        Text("\(truncatedLatitude)  \(truncatedLongitude)")
                            .font(.title)
                        Text("Altitude: \(truncatedAltitude)")
                            .font(.title)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        HStack{
                            Text("BOBR: \(bobrLargeText)")
                                .font(.title)
                            Text(" \(bobrSmallText)")
                                .font(.body)

                        }
                        Text("Heading | Course: \(heading) | \(heading)")
                            .font(.title)
                        Text("Groundspeed: \(groundSpeed)")
                            .font(.title)
                    }
                    Spacer()
                }
            RoundedRectangle(cornerRadius: CGFloat(10))
                .stroke(Color.black, lineWidth: 5)
                .frame(height: 100)
        }
        .background(Color("buttonBackGround"))
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EventViewModel()
        let event = viewModel.returnBlankEventForTesting()
        return EventView(event: event)
    }
}
