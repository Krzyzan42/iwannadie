//
//  FavoritesView.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 11/12/2024.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("My plants")
                        .font(.largeTitle)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(5)
                .background(Color.LightGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                FlowerList(plants: getFavoritePlants(plants))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(10)
        .background(Color.Green)
    }
    
    func getFavoritePlants(_ plants :[Plant]) -> [Plant] {
        var favorite_plants :[Plant] = []
        for plant in plants {
            if(favorites.isFavorite(plant)) {
                favorite_plants.append(plant)
            }
        }
        return favorite_plants
    }
}


struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(Favorites())
    }
}
