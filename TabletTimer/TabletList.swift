//
//  TabletList.swift
//  TabletTimer
//
//  Created by Daniel Pape on 10/05/2020.
//  Copyright © 2020 Daniel Pape. All rights reserved.
//

import SwiftUI

struct TabletList: View {
    var body: some View {
        List(testData) { tablet in
            TabletRow(tablet: tablet)
        }
    }
}

struct TabletList_Previews: PreviewProvider {
    static var previews: some View {
        TabletList()
    }
}
