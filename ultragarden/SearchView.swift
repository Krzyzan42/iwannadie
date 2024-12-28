//
//  SearchView.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 11/12/2024.
//

import SwiftUI

struct SearchView :View {
    @State private var searchText: String = ""
    
    var body :some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                TextField("Search...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.LightGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                FlowerList(plants: get_filtered())
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
    
    func get_filtered() -> [Plant] {
        if (searchText.isEmpty) {
            return plants;
        }
        var searchedPlants  :[Plant] = []
        for plant in plants {
            if (plant.name.lowercased().contains(searchText.lowercased())) {
                searchedPlants.append(plant)
            }
        }
        return searchedPlants;
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(Favorites())
    }
}
