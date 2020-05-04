

import Foundation
import SwiftUI

class ButtonData: ObservableObject {
    @Published var name: String
	@Published var color: Int = 0 {
		didSet {
			print("updated")
			self.updated = true
		}
	}
    @Published var updated = false
    init(button: CustomButton) {
        let colors = Colors().colorNames
        self.name = button.buttonName ?? ""
        self.color = colors.firstIndex(of: button.buttonColor ?? "Red") ?? 0
    }
}
