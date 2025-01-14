//
//  PlantHeader.swift
//  ultragarden
//
//  Created by Flow on 05.01.2025.
//

import SwiftUI

struct PlantHeader :View {
    var plant :Plant

    var body :some View {
        HStack() {
            Image(plant.imgName)
                .resizable(resizingMode: .stretch)
                .frame(width: 120.0, height: 200.0)
                .background(Color.DarkGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            ZStack(alignment: .leading) {
                VStack {
                    HStack {
                        Spacer()
                        FavoriteButton(plant: plant)
                            .frame(width: 40.0, height: 40.0)
                    }
                    Spacer()
                }
                Text(plant.name)
                    .font(.largeTitle)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 10)
                    .scaledToFit()
                    .minimumScaleFactor(0.8)
                    .frame(maxWidth: .infinity)
                    .background(Color.Green)
                    .clipShape(RoundedCorner(radius: 20, corners: [.topRight, .bottomRight]))
            }
        }
        .frame(maxHeight: 200)
    }
}


struct PlantHeader_Previews: PreviewProvider {
    static var previews: some View {
        PlantHeader(plant: get_plant(id: 8))
            .environmentObject(Calendar())
    }
}
