//
//  CalendarContentView.swift
//  agora-ios
//
//  Created by Siddharth sen on 7/4/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import KVKCalendar

struct CalendarContentView: View {
    var body: some View {
        NavigationView {
            CalendarDisplayView()
        }
    }
}

struct CalendarContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentView()
    }
}

//func electionEventBuilder() -> [Event]{
//
//    var events:[Event]
//
//    for i in 0...4{
//        var event = Event()
//
//        event.text = " Test Test Test\(i))"
//        event.backgroundColor = UIColor(displayP3Red: 0.4 + CGFloat(i/10), green: 0.4 + CGFloat(i/10) , blue: 0.8, alpha: 0.5)
//
//        event.start = Date()
//        event.end = Date(timeInterval: TimeInterval(9000 + i*20), since: Date())
//
//        events.append(event)
//    }
//
//
//}
