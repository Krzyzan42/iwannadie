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
                    }
                }
                VStack {
                    ForEach(Array(stride(from: 1, to: plants.count, by: 2)), id: \.self) { i in
                        FlowerTile(plant: plants[i])
                    }
                }
            }
        }
    }
}

struct FlowerTile: View {
    var plant: Plant
    
    var body: some View {
        NavigationLink(value: plant.id) {
            VStack{
                Image(plant.imgName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.DarkGreen)
                HStack{
                    Text(plant.name)
                        .font(.title2)
                    Spacer()
                    FavoriteButton(plant: plant)
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
    @EnvironmentObject var favorites: Favorites
    
    var plant: Plant
    
    var body: some View {
        Button(action: {
            favorites.toggleFavorite(plant)
        }) {
            Image(systemName: favorites.isFavorite(plant) ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.DarkGreen)
                .frame(maxWidth: 35, maxHeight: 35)
        }
    }
}
