//
//  PlantDetailView.swift
//  ultragarden
//
//  Created by Flow on 03.01.2025.
//

import SwiftUI

struct PlantDetailView :View {
    @State var isFront :Bool = true
    @State private var angle = 0.0
    var plant :Plant

    var body: some View {
        if isFront {
            PlantDetailFront(plant: plant, on_flip: { 
                    withAnimation(.easeIn) { 
                        angle += 90 
                    } completion: {
                        isFront = false
                        angle = -90
                        withAnimation(.easeOut) {
                            angle += 90
                        }
                    }
                } )
            .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Green)
        } else {
            PlantDetailBack(plant: plant, on_flip: {
                withAnimation(.easeIn) { 
                    angle -= 90 
                } completion: {
                    isFront = true
                    angle = 90
                    withAnimation(.easeOut) {
                        angle -= 90
                    }
                }
            })
            .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Green)
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant: get_plant(id: 0))
            .environmentObject(Favorites())
    }
}

