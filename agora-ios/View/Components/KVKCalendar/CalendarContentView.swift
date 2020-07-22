//
//  CalendarContentView.swift
//  agora-ios
//
//  Created by Siddharth sen on 7/4/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import KVKCalendar

class CalendarManager: ObservableObject{
    var currentTypeUserSelection:Int = 0
}

struct CalendarContentView: View {
    @State var userSelection:Int = 0
    @ObservedObject var calendarManager:CalendarManager = CalendarManager()
    
    @State var willCallFunc = false
    
    public enum CalendarType: String, CaseIterable {
        case day, week, month, year
    }

    var body: some View {
        VStack{
            HStack(spacing: 15){
                Spacer()
                Button(action: {self.userSelection = 0;self.calendarManager.currentTypeUserSelection = 0;self.willCallFunc = true}) {
                     
                     Text("\(CalendarType.day.rawValue.capitalized)")
                        .fontWeight(.medium)
                         .foregroundColor(self.userSelection == 0 ? .white : .black)
                         .padding(.vertical, 10)
                         .padding(.horizontal, 20)
                     
                 }
                .background(self.userSelection == 0 ? Color.init("_Purple") : Color.white)
                 .clipShape(Capsule())
                 
                Button(action: {self.userSelection = 1;self.calendarManager.currentTypeUserSelection = 1;self.willCallFunc = true}) {
                     
                     Text("\(CalendarType.week.rawValue.capitalized)")
                         .foregroundColor(self.userSelection == 1 ? .white : .black)
                         .padding(.vertical, 10)
                         .padding(.horizontal, 20)
                     
                 }
                 .background(self.userSelection == 1 ? Color.init("_Purple") : Color.white)
                 .clipShape(Capsule())
                 
                Button(action: { self.userSelection = 2;self.calendarManager.currentTypeUserSelection = 2;self.willCallFunc = true}) {
                     
                     Text("\(CalendarType.month.rawValue.capitalized)")
                         .foregroundColor(self.userSelection == 2 ? .white : .black)
                         .padding(.vertical, 10)
                         .padding(.horizontal, 20)
                     
                 }
                 .background(self.userSelection == 2 ? Color.init("_Purple") : Color.white)
                 .clipShape(Capsule())
                Spacer()
             }
            .padding(.vertical, 10).background(LinearGradient(gradient: Gradient(colors: [Color("Color2_2"), Color("Color2")]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.top))
            
            CalendarDisplayView(selectDate: Date(), isCallingFunc: $willCallFunc, calendarManager: calendarManager)
        }
         
    }
}

struct CalendarContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContentView(calendarManager: CalendarManager())
    }
}
