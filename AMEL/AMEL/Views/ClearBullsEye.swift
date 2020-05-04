//
//  ClearBullsEye.swift
//  AMEL
//
//  Created by Dimitri Cognata on 4/29/20.
//  Copyright © 2020 Marcellini, Neil. All rights reserved.
//

import SwiftUI

struct ClearBullsEye: View {
    @FetchRequest(fetchRequest: ReferencePoint.getPoints()) var points:FetchedResults<ReferencePoint>
    
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        Button(action: {
            for point in self.points {
                self.managedObjectContext.delete(point)
                do {
                    try self.managedObjectContext.save()
                }catch {
                        print(error)
                }
            }

        }) {
            Text("Clear All")
        }
        .padding()
        
    }
}

struct ClearBullsEye_Previews: PreviewProvider {
    static var previews: some View {
        ClearBullsEye()
    }
}
