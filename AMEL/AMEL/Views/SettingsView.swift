//
//  SettingsView.swift
//  AMEL
//
//  Created by Jeffrey Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
	@EnvironmentObject var userSettings:UserSetting
	private let colors = ["Red", "Green", "Blue"]
	@Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Button.getButtons()) var buttons:FetchedResults<Button>
    
	
    var body: some View {
        
        List {
        Section(header: Text("Events")) {
            
            ForEach(self.buttons, id: \.time) {button in
                ButtonRow(button: button)
                }
            }
        }
    }

}
#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
#endif
