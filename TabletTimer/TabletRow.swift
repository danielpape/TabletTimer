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
    
    var body: some View {
        HStack{
            Text(tablet.name)
            .bold()
            Spacer()
            HStack{
                Text(String(tablet.amount))
                Text(tablet.frequency)
            }
        }
    }
}

struct TabletRow_Previews: PreviewProvider {
    static var previews: some View {
        TabletRow(tablet: testData[0])
    }
}
