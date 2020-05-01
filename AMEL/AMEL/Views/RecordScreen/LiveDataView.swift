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
        HStack{
            Spacer()
            Text(locationVM.getLatLng())
            Spacer()
            Text(locationVM.getAltitude())
            Spacer()
            Text(headingVM.getCourse())
            Spacer()
            Text(locationVM.getGroundSpeed())
            Spacer()
            Text(refPointVM.getFormatedReferencePointHeading() + "/" + refPointVM.getFormatedReferencePointDistance())
        }
        .padding()
        .lineLimit(2)
    }
}

struct LiveDataView_Previews: PreviewProvider {
    static var previews: some View {
        LiveDataView(refPointVM: ActiveRefPointVM())
    }
}
