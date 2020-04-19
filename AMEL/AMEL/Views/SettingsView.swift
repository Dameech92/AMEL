//
//  SettingsView.swift
//  AMEL
//
//  Created by Jeffrey Romero on 4/10/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
	@Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ButtonData.getAllButtonData()) var buttons:FetchedResults<ButtonData>
    
	
    var body: some View {
        let settingsData = SettingsData()
        return VStack {
            Button(action: {
                let bSaver = ButtonSaver(settingsData: settingsData, context: self.managedObjectContext)
                bSaver.saveButton()
            }){
                Image(systemName: "plus")
            }
            List {
                Section(header: Text("Buttons")) {
                    ButtonRow(button: nil, settingsData: settingsData)
                    ForEach(self.buttons, id: \.time) {button in
                        ButtonRow(button: button, settingsData: settingsData)
                        }
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
