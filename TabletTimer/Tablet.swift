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
    var maxDoseageMinutes : Int
    var priority: Int
    var frequency: String
    var amount : Int
    
    func startTimer() {
        print("Timer started for "+name)
    }
}

#if DEBUG

var testData = [
    Tablet(name: "Amplodine", dateAdded: Date(), maxDoseageMinutes: 180, priority: 1, frequency: "daily", amount: 1),
    Tablet(name: "Levetiracetam", dateAdded: Date(), maxDoseageMinutes: 1, priority: 1, frequency: "daily", amount: 2),
    Tablet(name: "Codeine", dateAdded: Date(), maxDoseageMinutes: 1, priority: 2, frequency: "daily", amount: 1)
]

#endif
