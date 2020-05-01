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
    var refPointVM : ActiveRefPointVM

    @ObservedObject private var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("buttonBackGround"))
                .layoutPriority(0.5)
                .cornerRadius(10)
            VStack{
                Text(refPointVM.getFormatedReferencePointHeading() + "/" + refPointVM.getFormatedReferencePointDistance())
                    .font(.title)
                
                Divider()
                    .background(Color.primary)
                
                HStack{
                    Spacer()

                    VStack{
                        Text(locationVM.getLatLng())
                        Text(locationVM.getAltitude())
                    }
                    
                    Spacer()
                    Divider()
                        .frame(minHeight: 0, maxHeight: 50)
                        .background(Color.primary)
                    Spacer()
                    
                    VStack{
                        Text(headingVM.getCourse())
                        Text(locationVM.getGroundSpeed())
                    }
                    Spacer()
                }
            }
            .padding()
            .layoutPriority(1)
        }
        
    }
}

struct LiveDataView_Previews: PreviewProvider {
    static var previews: some View {
        LiveDataView(refPointVM: ActiveRefPointVM())
    }
}
