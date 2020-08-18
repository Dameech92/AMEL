//
//  DataTextColumn.swift
//  AMEL
//
//  Created by Neil Marcellini on 4/13/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct DataTextColumn: View {
    let dataList: [String]
    let smallText: Bool
    var body: some View {
        Group {
            Spacer()
            Text(dataList[0])
            Spacer()
            Text(dataList[1])
            Spacer()
            Text(dataList[2])
            Spacer()
        }
        .padding(5)
        .foregroundColor(Color("StealthText"))
    }
}

struct DataTextColumn_Previews: PreviewProvider {
    static var previews: some View {
        DataTextColumn(dataList: ["test1", "test2","test3"], smallText: false)
    }
}
