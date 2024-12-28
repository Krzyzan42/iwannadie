//
//  Favorites.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 12/12/2024.
//

import Foundation

class Favorites :ObservableObject {
    @Published private var favorites: Set<Int> = []
    
    init(ids: Set<Int> = [1, 3, 5, 7]) {
        self.favorites = ids
    }
    
    func isFavorite(_ plant: Plant) -> Bool {
        return favorites.contains(plant.id);
    }
    
    func addFavorite(_ plant: Plant) {
        if (isFavorite(plant)) { return }
        favorites.insert(plant.id)
        objectWillChange.send()
    }
    
    func removeFavorite(_ plant: Plant) {
        if (!isFavorite(plant)) { return }
        favorites.remove(plant.id)
        objectWillChange.send()
    }
    
    func toggleFavorite(_ plant: Plant) {
        if (isFavorite(plant)) {
            removeFavorite(plant)
        } else {
            addFavorite(plant)
        }
    }
}
