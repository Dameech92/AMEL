//
//  ButtonRow.swift
//  AMEL
//
//  Created by Dimitri Cognata on 4/18/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ButtonRow: View {
    @State var name = ""
    @State var color = 0
    let button: ButtonData?
    
    var body: some View {
        if button != nil {
            name = button!.name!
        }
        else {
            name = "default"
        }
        
        return HStack{
            TextField("Enter button name", text: $name)
            Picker(selection: $color, label: Text("Color")) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width:20, height: 20)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width:20, height: 20)
                Rectangle()
                    .fill(Color.green)
                    .frame(width:20, height: 20)
            }
        }
    }
}

struct ButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRow(button: ButtonData())
    }
}
