//
//  TxtFileWriter.swift
//  AMEL
//
//  Created by Tristan Nibbe on 5/19/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

class TxtFileWriter{
    static func writeLogToTxtFile(events: FetchedResults<Event>)->NSURL? {
        let fileName = "Log.txt"
        let filename = getDocumentsDirectory().appendingPathComponent(fileName)

        var EventString = ""
        for event in events{
            let EventVM = EventViewModel(event: event)
            EventString += EventVM.getTime() + "\n"
            EventString += EventVM.getName() + "\n"
            EventString += EventVM.getLatLng() + "\n"
            EventString += EventVM.getAltitude() + "\n"
            EventString += EventVM.getBoBR() + "\n"
            EventString += EventVM.getHeadingCourse() + "\n"
            EventString += EventVM.getGroundSpeed() + "\n"
            EventString += "Additional Notes: \n\n"
        }
        do {
            try EventString.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            return nil
        }
        return NSURL(fileURLWithPath: filename.path)

    }
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
