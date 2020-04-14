//
//  ButtonView.swift
//  AMEL
//
//  Created by Jeffrey Brian Romero on 3/8/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//
import SwiftUI

struct RecordView: View {
        
        var body: some View {
        ZStack{
             Color("stealth").edgesIgnoringSafeArea(.all)
             VStack{
                LiveDataView()
                Divider()
                HStack{
                 VStack{
                    ButtonView(name: "Bomb", color: UIColor.blue)
                    Spacer()
                     ButtonView(name: "Missile", color: UIColor.green)
                     Spacer()
                     ButtonView(name: "Navigation", color: UIColor.red)
                     Spacer()
                    
                     }
                         
                    VStack{
                    ButtonView(name: "NUKE EM!", color: UIColor.purple)
                         Spacer()
                        ButtonView(name: "Jammer", color: UIColor.brown)
                         Spacer()
                         ButtonView(name: "Eject", color: UIColor.orange)
                         Spacer()
                             
                     }
                 }
             }
             .padding(10.0)
          }
        }
    }

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
