//
//  RecordTutorial.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/21/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct RecordOverlay: View {
    @State var presentLiveData = true
    var body: some View {
        VStack {
            Text("This is the live data field")
            Spacer()
        }
       
        
    }
}

struct RecordTutorial_Previews: PreviewProvider {
    static var previews: some View {
        RecordOverlay()
    }
}
