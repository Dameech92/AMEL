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
                    ZStack {
                            
                            RoundedRectangle(cornerRadius: 0)
                               .fill(Color.blue)
                                .frame(minHeight: 0, maxHeight: 150)
                                .frame(minWidth: 0, maxWidth: 100)
                        EventTitleBackground(name: viewModel.getName(), color: viewModel.getColor())
                        .frame(minWidth:120, maxWidth: .infinity)
                        .layoutPriority(1)

                    }


                    Spacer()
                    VStack(alignment: .leading){
                        Text(viewModel.getTime())
                            .font(.title)
                        Spacer()
                        Text(viewModel.getLatLng())
                            .font(.title)
                        Spacer()

                        Text(viewModel.getAltitude())
                            .font(.title)

                    }
                    .layoutPriority(4)
                    .padding()
                    Spacer()
                    VStack(alignment: .leading){
                        HStack{
                            Text(viewModel.getBoBR())
                                .font(.title)
                        }
                        Spacer()
                        Text(viewModel.getHeadingCourse())
                            .font(.title)
                        Spacer()
                        Text(viewModel.getGroundSpeed())
                            .font(.title)

                    }
                    .layoutPriority(4)
                    .padding()
                    Spacer()
                }
            RoundedRectangle(cornerRadius: CGFloat(10))
                .stroke(Color.black, lineWidth: 8)
                .frame(minHeight: 0, maxHeight: .infinity)
        }
        .background(Color("buttonBackGround"))
        .frame(minHeight: 0, maxHeight: .infinity)

    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        return EventView(event: Event())
    }
}
