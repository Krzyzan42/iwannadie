//
//  Plant.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 05/12/2024.
//

import Foundation

struct Chore {
    var name :String
    var description :String
    var active_months :[Int]
    var intervalInDays :Int
}

struct Plant {
    var id :Int
    var name :String
    var imgName :String
    
    var growingConditions :[String]
    var chores :[Chore]
}

let all_months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

let plants = [
    Plant(id: 0, name: "Roza", imgName: "flower1", growingConditions: [
        "Full sunlight",
        "Partial sunlight",
        "All soil types"
    ], chores: [
        Chore(name: "Water", description: "Water once every 8 days for the entire year", active_months: all_months, intervalInDays: 8),
        Chore(name: "Fertilize", description: "Fertilize once per month during summer", active_months: [5, 6, 7, 8], intervalInDays: 30),
        Chore(name: "Cut", description: "Cut rose buds after they have bloomes", active_months: [], intervalInDays: 0)
    ]),
    Plant(id: 1, name: "Tulipan", imgName: "flower2", growingConditions: [], chores: []),
    Plant(id: 2, name: "Slonecznik", imgName: "flower3", growingConditions: [], chores: []),
    Plant(id: 3, name: "Fiolki", imgName: "flower4", growingConditions: [], chores: []),
    Plant(id: 4, name: "Pomidor", imgName: "flower5", growingConditions: [], chores: []),
    Plant(id: 5, name: "Papryka", imgName: "flower6", growingConditions: [], chores: []),
    Plant(id: 6, name: "Pope", imgName: "flower7", growingConditions: [], chores: []),
]

func get_plant(id :Int) -> Plant {
    return plants[id];
}