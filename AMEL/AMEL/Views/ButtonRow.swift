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
    let button: Button
    
    var body: some View {
        name = button.name!
        
        return HStack{
            TextField("Enter button name", text: $name)
        }
    }
}

struct ButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRow(button: Button())
    }
}
