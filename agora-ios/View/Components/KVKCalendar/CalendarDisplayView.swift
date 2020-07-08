//
//  CalendarDisplayView.swift
//  agora-ios
//
//  Created by Siddharth sen on 7/4/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import KVKCalendar
import RealmSwift


struct CalendarDisplayView: UIViewRepresentable {
    @ObservedObject var databaseElectionEvents = BindableResults(results: try! Realm(configuration: Realm.Configuration(schemaVersion : 4)).objects(DatabaseElection.self))
    
    private var calendar: CalendarView = {
        return CalendarView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 600))
    }()
        
    // Once when it is ready to display the view
    func makeUIView(context: UIViewRepresentableContext<CalendarDisplayView>) -> CalendarView {
        calendar.dataSource = context.coordinator
        calendar.delegate = context.coordinator
        calendar.reloadData()
        return calendar
    }
    // Update the configuration for the presented
    
    func updateUIView(_ uiView: CalendarView, context: UIViewRepresentableContext<CalendarDisplayView>) {
        context.coordinator.eventsForCalendar()
    }
    
    // Tell SwiftUI about the Coordinator class
    func makeCoordinator() -> CalendarDisplayView.Coordinator {
        Coordinator(self, databaseElectionEvents)
    }
    
    // MARK: Calendar DataSource and Delegate
    // Bridge between the data inside SwiftUI and the external framework
    
    class Coordinator: NSObject, CalendarDataSource, CalendarDelegate {
        func eventsForCalendar() -> [Event] {
            
           //let models = databaseElectionEvents // Get events from Database or API
           var events = [Event]()
           
            for model in bindableDatabase.results {
               var event = Event()
                event.id = RandomNumberGenerator.self
               event.start = model.start // start date event
               event.end = model.end // end date event
                event.color = nil
                event.isAllDay = model.isAllDay
               event.isContainsFile = false
           
               // Add text event (title, info, location, time)
               if model.isAllDay {
                   event.text = "\(model.title)"
               } else {
                event.text = "\(model.start) - \(model.end)\n\(model.title)"
               }
               events.append(event)
           }
           return events
        }
        
//        func eventsForCalendar() -> [Event] {
//            var event = Event()
//            event.text = " Test Test Test Ls"
//            event.backgroundColor = UIColor(displayP3Red: 0.4, green: 0.4, blue: 0.8, alpha: 0.5)
//
//            event.start = Date()
//            event.end = Date(timeInterval: 9000, since: Date())
//
//            var event2 = Event()
//            event2.text = " Test"
//            event2.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.4, blue: 0.8, alpha: 0.5)
//
//            event2.start = Date()
//            event2.end = Date(timeInterval: 6000, since: Date())
//            return [event,event2]
//        }
        func createEvents(completion: ([Event]) -> Void) {
            
        }
        
        func willDisplayDate(_ date: Date?, events: [Event]) -> DateStyle? {
            return DateStyle(backgroundColor: UIColor(named: "Color2_2")!, textColor: .white, dotBackgroundColor: .purple)
        }
        
        private let view: CalendarDisplayView
        private let bindableDatabase:BindableResults<DatabaseElection>
        
        init(_ view: CalendarDisplayView,_ databaseResult:BindableResults<DatabaseElection>) {
            self.view = view
            self.bindableDatabase = databaseResult
            super.init()
        }
        
        
    }
}

struct CalendarDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDisplayView()
    }
}
