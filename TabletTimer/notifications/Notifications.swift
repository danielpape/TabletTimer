//
//  Tablet.swift
//  TabletTimer
//
//  Created by Daniel Pape on 09/05/2020.
//  Copyright © 2020 Daniel Pape. All rights reserved.
//

import SwiftUI

let content = UNMutableNotificationContent()
content.title = "Weekly Staff Meeting"
content.body = "Every Tuesday at 2pm"

// Configure the recurring date.
var dateComponents = DateComponents()
dateComponents.calendar = Calendar.current

dateComponents.weekday = 3  // Tuesday
dateComponents.hour = 14    // 14:00 hours
   
// Create the trigger as a repeating event.    
let trigger = UNCalendarNotificationTrigger(
         dateMatching: dateComponents, repeats: true)
         
// Create the request
let uuidString = UUID().uuidString
let request = UNNotificationRequest(identifier: uuidString, 
            content: content, trigger: trigger)

// Schedule the request with the system.
let notificationCenter = UNUserNotificationCenter.current()
notificationCenter.add(request) { (error) in
   if error != nil {
      // Handle any errors.
   }
}