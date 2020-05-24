//
//  TabletRow.swift
//  TabletTimer
//
//  Created by Daniel Pape on 10/05/2020.
//  Copyright © 2020 Daniel Pape. All rights reserved.
//

import SwiftUI

struct TabletRow: View {
    
    var tablet: Tablet
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    
    var body: some View {
        HStack{
            Text(tablet.name)
            .bold()
            Spacer()
            HStack{
                Button(action: {
                    self.appDelegate?.scheduleNotification(notificationType: "Local Notification",tablet: testData[0])
                    print("scheduled")
                }) {
                    Text("Start timer")
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        }
    }
}

struct TabletRow_Previews: PreviewProvider {
    static var previews: some View {
        TabletRow(tablet: testData[0])
    }
}
