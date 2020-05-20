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
    static func writeLogToTxtFile(events: FetchedResults<Event>) {
        let fileName = "Log"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        //let path = "/Users/tbenitez/output.txt"
        
        print("File Path: \(fileURL)")
        
        for event in events{
            let EventVM = EventViewModel(event: event)
            do{
                var EventString = ""
                do{
                    EventString += try String(contentsOfFile: fileURL.path)
                }catch let error as NSError{
                    print("failed to read file")
                    print(error)
                }
                EventString += EventVM.getTime() + "\n"
                EventString += EventVM.getName() + "\n"
                EventString += EventVM.getLatLng() + "\n"
                EventString += EventVM.getAltitude() + "\n"
                EventString += EventVM.getBoBR() + "\n"
                EventString += EventVM.getHeadingCourse() + "\n"
                EventString += EventVM.getGroundSpeed() + "\n"
                EventString += "Additional Notes: \n\n"

                try EventString.write(to: fileURL,atomically: true, encoding: String.Encoding.utf8)
                
            }catch let error as NSError{
                print("failed to write file")
                print(error)
            }
        }
        

    }
    
    static func readLogFromFile(){
        let fileName = "Log"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        var readString = ""
        do{
            readString = try String(contentsOf: fileURL)
        }catch let error as NSError{
            print("failed to read file")
            print(error)
        }
        
        print("Contents of the file \n \(readString)")
    }
}
