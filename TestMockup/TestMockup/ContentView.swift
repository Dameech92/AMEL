//
//  ContentView.swift
//  TestMockup
//
//  Created by Neil Marcellini on 2/19/20.
//  Copyright © 2020 Neil Marcellini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var doSomething: Int = 0
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {self.doSomething = self.doSomething + 1}){
                    Text("Missile")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                }
                Spacer()
                Button(action: {self.doSomething = self.doSomething + 1}){
                    Text("Bomb")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                }
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {self.doSomething = self.doSomething + 1}){
                    Text("Radar Jam")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                }
                Spacer()
                Button(action: {self.doSomething = self.doSomething + 1}){
                    Text("Refuel")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                }
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Text("Latitude: 34.197660")
                Spacer()
                Text("Longitude: -119.175950 ")
                Spacer()
                Text("Altitude: 1")
                Spacer()
            }

        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
