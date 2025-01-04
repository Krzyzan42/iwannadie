//
//  PlantDetailView.swift
//  ultragarden
//
//  Created by Flow on 03.01.2025.
//

import SwiftUI

struct PlantDetailView :View {
    @State var isFront :Bool = true
    var plant :Plant

    var body: some View {
        if isFront {
            PlantDetailFront(plant: plant, on_flip: { isFront.toggle() })
        } else {
            PlantDetailBack(plant: plant, on_flip: { isFront.toggle() })
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant: get_plant(id: 0))
            .environmentObject(Favorites())
    }
}

