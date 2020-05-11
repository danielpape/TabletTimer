//
//  Tablet.swift
//  TabletTimer
//
//  Created by Daniel Pape on 09/05/2020.
//  Copyright © 2020 Daniel Pape. All rights reserved.
//

import SwiftUI

struct Tablet: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var dateAdded: Date
    var priority: Int
    var frequency: String
    var amount : Int
}

#if DEBUG

var testData = [
    Tablet(name: "Amplodine", dateAdded: Date(), priority: 1, frequency: "daily", amount: 1),
    Tablet(name: "Levetiracetam", dateAdded: Date(), priority: 1, frequency: "daily", amount: 2),
    Tablet(name: "Codeine", dateAdded: Date(), priority: 2, frequency: "daily", amount: 1)
]

#endif
