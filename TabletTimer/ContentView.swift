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
    @State var Duration = ""
    @State var Priority = ""
    @State var Amount = ""
    @State var MaximumDosageRequired = false
    
    @State var showingdetail = false
    
    @State var Tablets = ["Codiene","Amlodipine"]
    
    var strengths = ["Daily", "Hourly", "When needed"]
    @State private var selectedStrength = 0
    
    var dosages = ["1 tablet", "2 tablets", "3 tablets", "4 tablets", "5 tablets"]
    @State private var selectedDosage = 0
    
    var priorities = ["Not essential", "Nice to have", "I need this to live"]
    @State private var selectedPriority = 0
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    var modalPresentation : some View {
        NavigationView {
            VStack{
                Form{
                    Section(header: Text("Details")){
                        TextField("Tablet Name", text: $TabletName)
                    }
                    Section(header: Text("Dosage")){
                        Picker(selection: $selectedDosage, label: Text("Dosage")) {
                            ForEach(0 ..< dosages.count) {
                                Text(self.dosages[$0])
                            }
                        }
                        Picker(selection: $selectedStrength, label: Text("Frequency")) {
                            ForEach(0 ..< strengths.count) {
                                Text(self.strengths[$0])
                            }
                        }
                        
                        Picker(selection: $selectedStrength, label: Text("Frequency")) {
                        ForEach(0 ..< strengths.count) {
                            Text(self.strengths[$0])
                        }
                        }
                                            
                        Button(action: {
                            self.MaximumDosageRequired = true

                        }) {
                            Text("Add maximum dosage")
                        }
            
                    }
                    Section(header: Text("Maximum Dosage")){
                        TextField("Amount", text: $Amount)
                        Picker(selection: $selectedStrength, label: Text("Frequency")) {
                            ForEach(0 ..< strengths.count) {
                                Text(self.strengths[$0])
                            }
                        }
                    }
                    Section(header: Text("Priority")){
                       Picker(selection: $selectedStrength, label: Text("Priority")) {
                           ForEach(0 ..< priorities.count) {
                               Text(self.priorities[$0])
                           }
                       }
                   }
                    Section{
                        Button(action: {
                        self.showingdetail.toggle()
                            self.addTablet()

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
        testData.append(Tablet(name: $TabletName.wrappedValue, dateAdded: Date(), maxDoseageMinutes: 1, priority: 2, frequency: "daily", amount: 2))
    }
    
    func delete(at offsets: IndexSet) {
        offsets.sorted { $0 > $1 }.forEach { testData.remove(at: $0) }
    }
            
    
    var body: some View{
    
        NavigationView{
            VStack{
                List{
                    ForEach(testData) { tablet in
                        NavigationLink(destination: TabletDetail(tablet:tablet)) {
                            TabletRow(tablet: tablet)
                        }
                        }
                .onDelete(perform: delete)
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
                    print("Ended")
                }
            }
        }
        .sheet(isPresented: $showingdetail) {
            self.modalPresentation
            }
        }

}
