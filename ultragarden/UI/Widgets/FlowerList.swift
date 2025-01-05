//
//  FlowerList.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 11/12/2024.
//

import Foundation
import SwiftUI

struct FlowerList :View {
    let plants: [Plant]
    
    var body :some View {
        ScrollView{
            HStack(alignment: .top) {
                VStack {
                    ForEach(Array(stride(from: 0, to: plants.count, by: 2)), id: \.self) { i in
                        FlowerTile(plant: plants[i])
                        .padding(4)
                    }
                }
                VStack {
                    ForEach(Array(stride(from: 1, to: plants.count, by: 2)), id: \.self) { i in
                        FlowerTile(plant: plants[i])
                        .padding(4)
                    }
                    HStack { Spacer() }
                }
            }
        }
    }
}

struct FlowerTile: View {
    var plant: Plant
    
    var body: some View {
        NavigationLink(value: NavigationTarget.PlantDetail(id: plant.id)) {
            VStack{
                Image(plant.imgName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.DarkGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                HStack{
                    Text(plant.name)
                        .font(.title2)
                        .foregroundColor(Color.black)
                    Spacer()
                    FavoriteButton(plant: plant)
                        .frame(maxWidth: 25, maxHeight: 25)
                }
                .padding(10)
            }
            .padding(10)
            .background(Color.LightGreen)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct FavoriteButton: View {
    @EnvironmentObject var calendar: Calendar

    var plant: Plant
    
    var body: some View {
        if (calendar.is_in_calendar(id: plant.id)) {
            Button(action: {
                calendar.remove_from_calendar(id: plant.id)
            }) {
                Image(systemName: "trash")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.red)
            }
        } else {
            NavigationLink(value: NavigationTarget.AddPlant(id: plant.id)) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.DarkGreen)
            }
        }
    }
}
