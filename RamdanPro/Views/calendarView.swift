//
//  calendarView.swift
//  RamdanPro
//
//  Created by Apple on 10/04/2021.
//

import SwiftUI
import ElegantCalendar

struct calendarView: View {
    
    var isShowingYearView: Bool
    @State private var calendarTheme: CalendarTheme = .royalBlue
    
    @ObservedObject var calendarManager = ElegantCalendarManager(configuration: CalendarConfiguration(startDate: Date().addingTimeInterval(TimeInterval(0 * 0 * 0 * (-30 * 36))),endDate: Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (30 * 36)))))
    init() {
        isShowingYearView = false
    }
    
    
    
    var body: some View {
        ZStack{
            
            Color.init(UIColor(Color("background8")))
                .ignoresSafeArea(edges: .all)
            VStack{
                ElegantCalendarView(calendarManager: calendarManager)
            }
            
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.top, .bottom])
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

struct calendarView_Previews: PreviewProvider {
    static var previews: some View {
        calendarView()
    }
}


