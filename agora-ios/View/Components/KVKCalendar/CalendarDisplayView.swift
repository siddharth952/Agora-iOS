//
//  CalendarDisplayView.swift
//  agora-ios
//
//  Created by Siddharth sen on 7/4/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import KVKCalendar


struct CalendarDisplayView: UIViewRepresentable {
    
    
    private var calendar: CalendarView = {
        return CalendarView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 600))
    }()
        
    func makeUIView(context: UIViewRepresentableContext<CalendarDisplayView>) -> CalendarView {
        calendar.dataSource = context.coordinator
        calendar.delegate = context.coordinator
        calendar.reloadData()
        return calendar
    }
    
    func updateUIView(_ uiView: CalendarView, context: UIViewRepresentableContext<CalendarDisplayView>) {
        
    }
    
    func makeCoordinator() -> CalendarDisplayView.Coordinator {
        Coordinator(self)
    }
    
    // MARK: Calendar DataSource and Delegate
    class Coordinator: NSObject, CalendarDataSource, CalendarDelegate {
        func eventsForCalendar() -> [Event] {
            var event = Event()
            event.text = " Test Test Test Ls"
            event.backgroundColor = UIColor(displayP3Red: 0.4, green: 0.4, blue: 0.8, alpha: 0.5)
            
            event.start = Date()
            event.end = Date(timeInterval: 9000, since: Date())
            
            var event2 = Event()
            event2.text = " Test"
            event2.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.4, blue: 0.8, alpha: 0.5)
            
            event2.start = Date()
            event2.end = Date(timeInterval: 6000, since: Date())
            return [event,event2]
        }
        
        func willDisplayDate(_ date: Date?, events: [Event]) -> DateStyle? {
            return DateStyle(backgroundColor: UIColor(named: "Color2_2")!, textColor: .white, dotBackgroundColor: .purple)
        }
        
        private let view: CalendarDisplayView
        
        init(_ view: CalendarDisplayView) {
            self.view = view
            super.init()
        }
        
        
    }
}

struct CalendarDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDisplayView()
    }
}
