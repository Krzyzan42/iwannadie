//
//  CalendarView.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 12/12/2024.
//

import SwiftUI

struct CalendarView: View {
    let circleSize = 40.0
    
    var body :some View {
        VStack {
            VStack() {
                Text("June")
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(11...15, id: \.self) { number in
                        ZStack {
                            Circle()
                                .frame(width: circleSize, height: circleSize)
                                .foregroundColor(number == 11 ? Color.Green : Color.Gray)
                            Text("\(number)")
                        }.padding(.horizontal, 10)
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
                TodoItem(name: "Water tomatoes", done: false)
                TodoItem(name: "Fertilize cucumbers", done: false)
                TodoItem(name: "Cut roses", done: true)
                
            }
            .padding(20)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Green)
    }
}

struct TodoItem :View {
    var name :String
    var done :Bool
    
    var body :some View {
        HStack {
            Text(name)
                .font(.title2)
            Spacer()
            ZStack {
                Rectangle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.LightGray)
                if(done) {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.DarkGreen)
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
    }
}
