//
//  PlantDetail.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 05/12/2024.
//

import SwiftUI

struct PlantDetailBack: View {
    var plant :Plant
    var on_flip :() -> Void = {}

    var body: some View {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    PlantHeader(plant: plant)
                    VStack(alignment: .leading, spacing: 5) {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Growing conditions")
                                    .font(.title)
                                    .padding(.top, 10.0)
                                Divider()
                                    .frame(height: 3)
                                    .overlay(Color.Green)
                                    .padding(0)
                                ScrollView() {
                                    ForEach(plant.growingConditions, id: \.self) { item in
                                        Text(item)
                                            .padding(.top, 20)
                                            .padding(.bottom, 10)
                                    }
                                } 
                            }
                        }
                    
                        Spacer()
                        Button(action: on_flip) {
                            ZStack {
                                HStack {
                                    Image(systemName: "arrow.left")
                                        .padding(.horizontal, 20)
                                    Spacer()
                                }
                                Text("How to care?")
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.Green)
                        .foregroundColor(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .background(Color.LightGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15));
                Spacer()
            }
        }
}

struct PlantDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailBack(plant: get_plant(id: 0));
    }
}
