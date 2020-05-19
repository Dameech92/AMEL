

import Foundation
import SwiftUI

class ButtonData: ObservableObject {
    @Published var name: String {
        didSet {
            if name.count > 14 && oldValue.count <= 14 {
                name = oldValue
            }
        }
    }
	@Published var color: Int = 0 
    @Published var updated = false
    init(button: CustomButton) {
        let colors = Colors().colorNames
        self.name = button.buttonName ?? ""
        self.color = colors.firstIndex(of: button.buttonColor ?? "Red") ?? 0
    }
}
