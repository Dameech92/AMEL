//
//  ReviewPrompter.swift
//  AMEL
//
//  Created by Neil Marcellini on 6/13/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import StoreKit

struct ReviewPrompter {
    static func requestReviewIfAppropriate() {
        let launchCount = UserDefaults.standard.integer(forKey: "launchCount")
        print(launchCount)
        if launchCount == 7 {
            SKStoreReviewController.requestReview()
        }
    }
}
