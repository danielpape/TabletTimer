//
//  TaskStore.swift
//  todo
//
//  Created by Daniel Pape on 18/06/2019.
//  Copyright © 2019 Daniel Pape. All rights reserved.
//

import SwiftUI
import Combine

class TabletStore : ObservableObject {
    var tablets: [Tablet] {
        didSet { didChange.send(()) }
    }
    
    init (tablets: [Tablet] = []) {
        self.tablets = tablets
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
