//
//  AddPlantView.swift
//  ultragarden
//
//  Created by Flow on 04.01.2025.
//


import SwiftUI

struct AddPlantView: View {
    var plant: Plant
    @State private var date = Date.now
    @State private var selectedNumber = 1
    @EnvironmentObject var calendar: Calendar
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Add plant")
                    .font(.title)
                    .padding(.top, 10.0)
                Divider()
                    .frame(height: 3)
                    .overlay(Color.Green)
                    .padding(.bottom, 30)

                HStack(alignment: VerticalAlignment.top) {
                    Image(plant.imgName)
                        .resizable(resizingMode: .stretch)
                        .frame(width: 120.0, height: 200.0)
                        .background(Color.DarkGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 40.0, height: 40.0)
                                .foregroundColor(Color.DarkGreen)
                        }
                        Text(plant.name)
                            .font(.largeTitle)
                            .padding(30)
                            .frame(maxWidth: .infinity)
                            .background(Color.Green)
                            .clipShape(RoundedCorner(radius: 20, corners: [.topRight, .bottomRight]))
                    }
                }
                VStack(alignment: .leading, spacing: 5) {

                    DatePicker(selection: $date, in: Date.now..., displayedComponents: .date) {
                        Text("Starting date")
                            .font(.title2)
                    }
                    .padding(.top, 40)
                    .padding(.bottom, 15)

                    HStack {
                        Text("Number of plants")
                        Spacer()
                        Picker("", selection: $selectedNumber) {
                            ForEach(1..<100) { number in
                                Text("\(number)").tag(number)
                                    .foregroundColor(Color.black)
                            }
                        }
                        .frame(maxWidth: 110)
                        .background(Color.Green)
                        .accentColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    }


                    Spacer()

                    HStack {
                        Button("Cancel", action: {
                            presentationMode.wrappedValue.dismiss()
                        })
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.red)
                        .foregroundColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 30))

                        Button("Add", action: {
                            calendar.add_to_calendar(id: plant.id, date_added: date, count: selectedNumber)
                            presentationMode.wrappedValue.dismiss()
                        })
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.Green)
                        .foregroundColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            .background(Color.LightGreen)
            .clipShape(RoundedRectangle(cornerRadius: 15));
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Green)
    }
}


struct AddPlantView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlantView(plant: get_plant(id: 0))
            .environmentObject(Favorites())
    }
}
