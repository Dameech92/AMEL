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
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    @ObservedObject private var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.horizontalSizeClass) var widthSizeClass
    @Environment(\.verticalSizeClass) var heightSizeClass
    var body: some View {
        let activePointVM = ActiveRefPointVM(points: self.points)
        let smallFont = widthSizeClass == .compact || heightSizeClass == .compact
        let pLat = locationVM.getLatRaw()
        let pLong = locationVM.getLongRaw()
        return ZStack{
            Rectangle()
                .fill(Color("buttonBackGround"))
                .layoutPriority(0.5)
                .cornerRadius(10)
            VStack{
                HStack {
                    Spacer()
                    Text(locationVM.getLocationAccuracy())
                }
                
                HStack{
                    Spacer()
                    if heightSizeClass == .compact {
                        Text(locationVM.getLatLng())
                        Text(locationVM.getAltitude())
                    }else {
                        VStack{
                            Text(locationVM.getLatLng())
                            Text(locationVM.getAltitude())

                        }
                    }
                    
                    
                    Spacer()
                    Divider()
                        .frame(minHeight: 0, maxHeight: 50)
                        .background(Color.primary)
                    Spacer()
                    if heightSizeClass == .compact {
                        Text(headingVM.getCourse())
                        Text(locationVM.getGroundSpeed())
                        
                    }else {
                        VStack{
                            Text(headingVM.getCourse())
                            Text(locationVM.getGroundSpeed())
                        }
                    }
                    
                    
                    Spacer()
                }
                .font(smallFont ? .body : .title)
                
                Divider()
                    .background(Color.primary)
                
                Text(activePointVM.getFormatedReferencePointHeading(pLat: pLat, pLong: pLong) + "/" + activePointVM.getFormatedReferencePointDistance(pLat: pLat, pLong: pLong))
                    .font(smallFont ? .title : .system(size: 45))
                Text(activePointVM.getReferencePointName())
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
