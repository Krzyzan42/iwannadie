//
//  PlantCare.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 18/12/2024.
//

import SwiftUI

struct PlantDetailFront: View {
    var plant :Plant
    var on_flip :() -> Void = {}
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                PlantHeader(plant: plant)
                VStack(alignment: .leading, spacing: 5) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 5) {
                        ForEach(plant.chores, id: \.self.name) { chore in 
                            Text(chore.name)
                                .font(.title)
                                .padding(.top, 10.0)
                            Divider()
                                .frame(height: 3)
                                .overlay(Color.Green)
                                .padding(0)
                            Text(chore.description)
                                .padding(.bottom, 10)
                        }
                        }
                    }
                    Spacer()

                    Button(action: on_flip) {
                        ZStack {
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .padding(.horizontal, 20)
                            }
                            Text("Best conditions")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.Green)
                    .foregroundColor(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 30))

                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        ZStack {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .padding(.horizontal, 20)
                                Spacer()
                            }
                            Text("Back")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.Gray)
                    .foregroundColor(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            .background(Color.LightGreen)
            .clipShape(RoundedRectangle(cornerRadius: 15));
        }
    }
}

struct PlantCare_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailFront(plant: get_plant(id: 0));
    }
}
