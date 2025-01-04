//
//  CalendarView.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 12/12/2024.
//

import SwiftUI
import Foundation

struct CalendarView: View {
    let circleSize = 50.0
    @State private var selectedDate :Date = Date()
    @EnvironmentObject var calendar :Calendar
    
    var body :some View {
        VStack {
            VStack() {
                Text(month_name())
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(self.get_next_dates(count: 5), id: \.self) { date in
                        Button(action: { selectedDate = date }) {
                           Text("\(Foundation.Calendar.current.component(.day, from: date))")
                        }
                        .frame(width: circleSize, height: circleSize)
                        .background(dates_equal(d1: date, d2: selectedDate) ? Color.Green : Color.Gray)
                        .foregroundColor(Color.black)
                        .clipShape(Circle())
                        Spacer()
                    }
                }
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color.LightGreen)
            VStack(spacing: 20) {
                Text("Plan for today")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(calendar.get_all_entries(), id: \.id) { plant_entry in 
                    ForEach(plant_entry.chores, id: \.id) { chore in 
                        if dates_equal(d1: chore.next_due_date, d2: selectedDate) {
                            TodoItem(plant_entry: plant_entry, chore_entry: chore)
                        }
                    }
                
                }
            }
            .padding(20)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Green)
    }

    func get_next_dates(count :Int) -> [Date] {
        var dates :[Date] = []
        for index in 0..<count {
            dates.append( 
                Foundation.Calendar.current.date(byAdding: .day, value: index, to: Date()) ?? Date()
            )
        }
        return dates
    }

    func month_name() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: Date())
    }
}

struct TodoItem :View {
    var plant_entry :PlantEntry
    @ObservedObject var chore_entry :ChoreEntry
    
    var body :some View {
        HStack {
            Text(chore_entry.name + " " + plant_entry.plant.plural)
                .font(.title2)
            Spacer()
            Button(action: {chore_entry.mark_done()}) {
                ZStack {
                    Rectangle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.LightGray)

                    if(!dates_equal(d1: chore_entry.next_due_date, d2: Date())) {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color.DarkGreen)
                    }
                }
            }
        }
        .padding(20)
        .background(Color.LightGreen)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(Calendar())
    }
}
