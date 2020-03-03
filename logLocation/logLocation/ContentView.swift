//
//  ContentView.swift
//  logLocation
//
//  Created by Marcellini, Neil on 2/24/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//  Created by Cognata, Dimitri on 3/2/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.

import SwiftUI
import CoreLocation

struct ContentView: View {
    @State var rand = 0
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Event.getEvents()) var events:FetchedResults<Event>
    @State private var eventName = "Missile"
    
    var body: some View {
        ///
            VStack{
                Text("Lat/Long/Alt")
                 LocationView()
            HStack{
                VStack{
                
                    Button(action: {
                        self.rand = self.rand + 1}) {
                        Text("PRESS!")
                            
                    }.frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
                        Spacer()
                    
                    Button(action: {self.rand = self.rand + 1}){ Text("Radar!")
                    }.frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
                        Spacer()
                    
                    Button(action: {self.rand = self.rand + 1}){ Text("Button!")
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.gray)
                        .cornerRadius(40)
                    Spacer()
                        
                }
                
                VStack{
                    
                        Button(action: {self.rand = self.rand + 1}){
                            Text("Missle!")
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .padding()
                            .foregroundColor(.black)
                            .background(Color.gray)
                            .cornerRadius(40)
                            Spacer()
                
                        Button(action: {self.rand = self.rand + 1}){ Text("Radar!")
                        }.frame(minWidth: 0, maxWidth: .infinity)
                         .frame(minHeight: 0, maxHeight: .infinity)
                         .padding()
                         .foregroundColor(.black)
                         .background(Color.gray)
                         .cornerRadius(40)
                        Spacer()
                        
                        Button(action: {self.rand = self.rand + 1}){ Text("Button!")
                        }.frame(minWidth: 0, maxWidth: .infinity)
                         .frame(minHeight: 0, maxHeight: .infinity)
                         .padding()
                         .foregroundColor(.black)
                         .background(Color.gray)
                         .cornerRadius(40)
                        Spacer()
                            
                    }
            }
            .padding(10.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
