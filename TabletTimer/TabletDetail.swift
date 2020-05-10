//
//  TabletDetail.swift
//  TabletTimer
//
//  Created by Daniel Pape on 10/05/2020.
//  Copyright © 2020 Daniel Pape. All rights reserved.
//

import SwiftUI

struct TabletDetail: View {
    var tablet: Tablet
    
    var body: some View {
        Text(tablet.name)
        .navigationBarTitle(Text(tablet.name), displayMode: .inline)
    }
}

struct TabletDetail_Previews: PreviewProvider {
    static var previews: some View {
        TabletDetail(tablet: testData[0])
    }
}
