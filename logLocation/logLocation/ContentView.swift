//
//  ContentView.swift
//  logLocation
//
//  Created by Marcellini, Neil on 2/24/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @ObservedObject private var locationManager = LocationManager()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    
    @State private var eventName = "Missile"
    
    var body: some View {
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        let truncatedLatitude = String(format: "%.4f", coordinate.latitude)
        let truncatedLongitude = String(format: "%.4f", coordinate.longitude)
        let altitude = self.locationManager.location != nil ? self.locationManager.location!.altitude : CLLocationDistance()
        let truncatedAltitude = String(format: "%.2f", altitude)
        return VStack{
            Spacer()
            Button(action: {
                let newEvent = Event(context: self.managedObjectContext)
                newEvent.name = self.eventName
                newEvent.latitude = coordinate.latitude as NSNumber
                newEvent.longitude = coordinate.longitude as NSNumber
                newEvent.altitude = altitude as NSNumber
                newEvent.time = Date()
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print("Error saving")
                }
                
            }) {
                Text(eventName)
                .background(Color.black)
                .padding()
                .foregroundColor(Color.white)
            }
            Text("Lat/Lng/Alt")
            Text("\(truncatedLatitude)/\(truncatedLongitude)/\(truncatedAltitude)")
            Spacer()
            List {
                Section(header: Text("Events")) {
                    ForEach(self.events) { (event: Event) in
                        EventView(name: event.name, time: event.time, latitude: event.latitude.doubleValue, longitude: event.longitude.doubleValue, altitude: event.altitude.doubleValue)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
