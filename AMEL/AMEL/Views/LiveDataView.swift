//
//  LiveDataView.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/14/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct LiveDataView: View {
    private let locationVM = LocationViewModel()
    private let headingVM = HeadingViewModel()

    @ObservedObject private var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("buttonBackGround"))
                .layoutPriority(0.5)
                .cornerRadius(10)
            VStack{
                
                HStack{
                    Spacer()

                    VStack{
                        Text(locationVM.getLatLng())
                            .font(.title)
                        Text(locationVM.getAltitude())
                            .font(.title)

                    }
                    
                    Spacer()
                    Divider()
                        .frame(minHeight: 0, maxHeight: 50)
                        .background(Color.primary)
                    Spacer()
                    
                    VStack{
                        Text(headingVM.getCourse())
                            .font(.title)

                        Text(locationVM.getGroundSpeed())
                            .font(.title)
                    }
                    Spacer()
                }
                
                Divider()
                    .background(Color.primary)
                
                Text(ActiveRefPointVM.shared.getFormatedReferencePointHeading() + "/" + ActiveRefPointVM.shared.getFormatedReferencePointDistance())
                    .font(.system(size: 45))
                Text(ActiveRefPointVM.shared.getReferencePointName())
            }
            .padding()
            .layoutPriority(1)
        }
        
    }
}

struct LiveDataView_Previews: PreviewProvider {
    static var previews: some View {
        LiveDataView()
    }
}
