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
                    EventTitleBackground(name: name)
                        .frame(minWidth:120, maxWidth: .infinity)
                        .layoutPriority(1)



                    Spacer()
                    VStack(alignment: .leading){
                        Text(time)
                            .font(.title)
                        Spacer()
                        Text("\(truncatedLatitude)  \(truncatedLongitude)")
                            .font(.title)
                        Spacer()

                        Text("Altitude: \(truncatedAltitude)")
                            .font(.title)

                    }
                    .layoutPriority(4)
                    .padding()
                    Spacer()
                    VStack(alignment: .leading){
                        HStack{
                            Text("BOBR: \(bobrLargeText)")
                                .font(.title)
                            Text(" \(bobrSmallText)")
                                .font(.body)

                        }
                        Spacer()
                        Text("Heading | Course: \(heading) | \(heading)")
                            .font(.title)
                        Spacer()
                        Text("Groundspeed: \(groundSpeed)")
                            .font(.title)

                    }
                    .layoutPriority(4)
                    .padding()
                    Spacer()
                }
            RoundedRectangle(cornerRadius: CGFloat(10))
                .stroke(Color.black, lineWidth: 5)
                .frame(minHeight: 0, maxHeight: .infinity)
        }
        .background(Color("buttonBackGround"))
        .frame(minHeight: 0, maxHeight: .infinity)

    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        let event = EventViewModel.returnBlankEventForTesting()
        return EventView(event: event)
    }
}
