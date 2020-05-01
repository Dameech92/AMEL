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
    var body: some View {
        VStack(alignment: .leading){
            Text(dataList[0])
            Spacer()
            Text(dataList[1])
            Spacer()
            Text(dataList[2])
        }
        .padding(5)
    }
}

struct DataTextColumn_Previews: PreviewProvider {
    static var previews: some View {
        DataTextColumn(dataList: ["test1", "test2","test3"])
    }
}
