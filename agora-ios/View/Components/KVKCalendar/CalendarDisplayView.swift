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
        
        var style = Style()
        if UIDevice.current.userInterfaceIdiom == .phone {
            style.month.isHiddenSeporator = true
            style.timeline.widthTime = 40
            style.timeline.offsetTimeX = 2
            style.timeline.offsetLineLeft = 2
        } else {
            style.timeline.widthEventViewer = 500
        }
        style.timeline.startFromFirstEvent = false
        style.timeline.offsetTimeY = 80
        style.timeline.offsetEvent = 3
        style.timeline.currentLineHourWidth = 40
        style.allDay.isPinned = true
        style.startWeekDay = .sunday
        style.timeHourSystem = .twelveHour
        
        return CalendarView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: style)
        
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
        
        func willDisplayDate(_ date: Date?, events: [Event]) -> DateStyle? {
            // DateStyle
            // - backgroundColor = cell background color
            // - textColor = cell text color
            // - dotBackgroundColor = selected date dot color
            return DateStyle(backgroundColor: .clear, textColor: .black, dotBackgroundColor: .green)
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
