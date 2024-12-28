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
    var startDate :Date?
    var endDate :Date?
    var intervalInDays :Int
}

struct Plant {
    var id :Int
    var name :String
    var imgName :String
    
    var growingConditions :[String]
    var chores :[Chore]
}

let plants = [
    Plant(id: 0, name: "Roza", imgName: "flower1", growingConditions: [], chores: []),
    Plant(id: 1, name: "Tulipan", imgName: "flower2", growingConditions: [], chores: []),
    Plant(id: 2, name: "Slonecznik", imgName: "flower3", growingConditions: [], chores: []),
    Plant(id: 3, name: "Fiolki", imgName: "flower4", growingConditions: [], chores: []),
    Plant(id: 4, name: "Pomidor", imgName: "flower5", growingConditions: [], chores: []),
    Plant(id: 5, name: "Papryka", imgName: "flower6", growingConditions: [], chores: []),
    Plant(id: 6, name: "Pope", imgName: "flower7", growingConditions: [], chores: []),
]
