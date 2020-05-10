//
//  ContentView.swift
//  TabletTimer
//
//  Created by Daniel Pape on 09/05/2020.
//  Copyright © 2020 Daniel Pape. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        
        Home()
        
    }
}

#if DEBUG

//struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
////        ContentView(store: TabletStore)
//       }
//}

#endif

struct Home : View {
        
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var TabletName = ""
    @State var Duration = "0"
    
    @State var showingdetail = false
    
    @State var Tablets = ["Codiene","Amlodipine"]
    
    var modalPresentation : some View {
        NavigationView {
            VStack{
                Form{
                    Section(header: Text("Tablet Details")){
                        TextField("Tablet Name", text: $TabletName)
                        TextField("Duration", text: $Duration)
                    }
                    Section{
                        Button(action: {
                        self.showingdetail.toggle()
                        }) {
                            Text("Add tablet")
                        }
                    }
                    
                }
            }
        .navigationBarTitle(Text("Add Tablet"))
        .navigationBarItems(trailing:
            Button(action: {
                self.showingdetail = false }) { Text("Close") })
        }
    }
    
    func addTablet() {
        
    }
            
    
    var body: some View{
    
        NavigationView{
            VStack{
                List(testData) { tablet in
                    NavigationLink(destination: TabletDetail(tablet: tablet)) {
                        TabletRow(tablet: tablet)
                    }
                }
                    
                    Button(action: {
                        
                        self.showingdetail = !self.showingdetail
                        
                    }) {
                        HStack(spacing:15) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                            Text("Add New")
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                        .background(Color.red)
                        .clipShape(Capsule())
                    .shadow(radius: 6)
                    }
                
                .padding(.top, 55)
            }
        .navigationBarTitle(Text("Tablets"))
        }
        .onAppear(perform: {
            UNUserNotificationCenter.current().requestAuthorization(options:
                [.badge,.sound,.alert]) { (_, _) in
                    
            }
        })
        .onReceive(self.time) { (_) in
        
            if self.start{
                
                if self.count != 15 {
                    self.count += 1
                    withAnimation(.default){
                        self.to = CGFloat(self.count) / 15
                    }
                    print("hello")
                }
                else {

                    self.start.toggle()
                    self.Notify()
                    print("Ended")
                }
            }
        }
        .sheet(isPresented: $showingdetail) {
            self.modalPresentation
            }
        }
    
    func Notify(){
        
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer completed"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
        
    }
}
