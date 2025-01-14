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
    var plural :String
    var imgName :String
    var ytVideo :String? = nil
    
    var growingConditions :[String]
    var chores :[Chore]
}

let all_months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
var plants = [
    Plant(id: 0, name: "Anemone", plural: "Anemones", imgName: "anemone", growingConditions: [
        "Partial shade",
        "Moist soil",
        "Humus-rich soil"
    ], chores: [
        Chore(name: "Water", description: "Water when the soil is dry, especially during dry periods", active_months: [1, 2, 3, 4, 5, 6, 9, 10], intervalInDays: 1),
        Chore(name: "Fertilize", description: "Fertilize with compost or organic fertilizer once in spring", active_months: [3, 4], intervalInDays: 30)
    ]),

    Plant(id: 1, name: "Sneezeweed", plural: "Sneezeweeds", imgName: "sneezeweed", growingConditions: [
        "Full sunlight",
        "Dry soil",
        "Sandy soil"
    ], chores: [
        Chore(name: "Water", description: "Water sparingly, as it is drought-tolerant", active_months: [5, 6, 7, 8, 9], intervalInDays: 14),
        Chore(name: "Fertilize", description: "Apply a light dose of fertilizer once in spring", active_months: [1, 2, 3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back stems in late autumn to promote healthy growth", active_months: [10, 11], intervalInDays: 365)
    ]),

    Plant(id: 2, name: "Canterbury Bell", plural: "Canterbury Bells", imgName: "canterbury_bell", growingConditions: [
        "Full sunlight",
        "Fertile soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly to keep the soil moist, but not waterlogged", active_months: [1, 2, 3, 4, 5, 6, 7, 8], intervalInDays: 5),
        Chore(name: "Fertilize", description: "Fertilize once per month during the growing season", active_months: [4, 5, 6, 7], intervalInDays: 30),
        Chore(name: "Cut", description: "Cut back after flowering to prevent seed formation", active_months: [8, 9], intervalInDays: 365)
    ]),

    Plant(id: 3, name: "Catalpa", plural: "Catalpas", imgName: "catalpa", growingConditions: [
        "Full sunlight",
        "Fertile soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water deeply during dry periods, especially for young trees", active_months: [5, 6, 7, 8, 9], intervalInDays: 10),
        Chore(name: "Fertilize", description: "Apply slow-release fertilizer once in early spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut dead or damaged branches in late winter", active_months: [2, 3], intervalInDays: 365)
    ]),

    Plant(id: 4, name: "Daffodil", plural: "Daffodils", imgName: "daffodil", growingConditions: [
        "Full sunlight",
        "Partial sunlight",
        "All soil types"
    ], chores: [
        Chore(name: "Water", description: "Water regularly after planting bulbs, and during flowering", active_months: [3, 4, 5], intervalInDays: 7),
        Chore(name: "Fertilize", description: "Fertilize with bulb-specific fertilizer once in early spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut foliage only after it has turned yellow", active_months: [6, 7], intervalInDays: 365)
    ]),

    Plant(id: 5, name: "Dahlia", plural: "Dahlias", imgName: "dahlia", growingConditions: [
        "Full sunlight",
        "Fertile soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water deeply 2–3 times a week, depending on weather", active_months: [5, 6, 7, 8, 9], intervalInDays: 3),
        Chore(name: "Fertilize", description: "Fertilize every 2 weeks during the growing season", active_months: [6, 7, 8], intervalInDays: 14),
        Chore(name: "Cut", description: "Cut back stems after the first frost to store tubers", active_months: [10, 11], intervalInDays: 365)
    ]),

    Plant(id: 6, name: "Echinacea", plural: "Echinaceas", imgName: "echinacea", growingConditions: [
        "Full sunlight",
        "Well-drained soil",
        "Dry soil"
    ], chores: [
        Chore(name: "Water", description: "Water sparingly, as it tolerates drought", active_months: [5, 6, 7, 8, 9], intervalInDays: 10),
        Chore(name: "Fertilize", description: "Apply compost in early spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back stems in late autumn after flowering", active_months: [10, 11], intervalInDays: 365)
    ]),

    Plant(id: 7, name: "Eggplant", plural: "Eggplants", imgName: "eggplant", growingConditions: [
        "Full sunlight",
        "Fertile soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water deeply and regularly to keep the soil consistently moist", active_months: [5, 6, 7, 8, 9], intervalInDays: 3),
        Chore(name: "Fertilize", description: "Fertilize every 2 weeks with a high-potassium fertilizer", active_months: [5, 6, 7, 8], intervalInDays: 14),
        Chore(name: "Cut", description: "Cut back any damaged or diseased leaves to maintain plant health", active_months: [5, 6, 7, 8], intervalInDays: 30)
    ]),

    Plant(id: 8, name: "Heliopsis Heliantoides", plural: "Heliopsis Heliantoides", imgName: "heliopsis_helianthoides", growingConditions: [
        "Full sunlight",
        "Dry soil",
        "All soil types"
    ], chores: [
        Chore(name: "Water", description: "Water sparingly, as it tolerates drought", active_months: [5, 6, 7, 8, 9], intervalInDays: 10),
        Chore(name: "Fertilize", description: "Apply compost or general-purpose fertilizer once in spring", active_months: [4], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back stems in late autumn after flowering", active_months: [10, 11], intervalInDays: 365)
    ]),

    Plant(id: 9, name: "Hellebore", plural: "Hellebores", imgName: "hellebore", growingConditions: [
        "Partial shade",
        "Humus-rich soil",
        "Moist soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly to keep the soil moist, especially during dry periods", active_months: [3, 4, 5, 6, 9, 10], intervalInDays: 7),
        Chore(name: "Fertilize", description: "Fertilize with organic compost or slow-release fertilizer once in spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back old leaves in late winter to make way for new growth", active_months: [2, 3], intervalInDays: 365)
    ]),

    Plant(id: 10, name: "Hibiscus", plural: "Hibiscuses", imgName: "hibiscus", growingConditions: [
        "Full sunlight",
        "Moist soil",
        "Fertile soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly to keep the soil consistently moist", active_months: [5, 6, 7, 8, 9], intervalInDays: 3),
        Chore(name: "Fertilize", description: "Fertilize every 2 weeks during the growing season", active_months: [5, 6, 7, 8], intervalInDays: 14),
        Chore(name: "Cut", description: "Cut back after flowering to promote new growth", active_months: [9, 10], intervalInDays: 365)
    ]),

    Plant(id: 11, name: "Iris", plural: "Irises", imgName: "iris", growingConditions: [
        "Full sunlight",
        "Moist soil",
        "Fertile soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly during the growing season", active_months: [4, 5, 6], intervalInDays: 7),
        Chore(name: "Fertilize", description: "Fertilize with a bulb-specific fertilizer in early spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back leaves after they turn yellow in late summer", active_months: [8, 9], intervalInDays: 365)
    ]),

    Plant(id: 12, name: "Kalmia", plural: "Kalmias", imgName: "kalmia", growingConditions: [
        "Partial shade",
        "Acidic soil",
        "Moist soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly to keep the soil moist", active_months: [4, 5, 6, 7, 8], intervalInDays: 7),
        Chore(name: "Fertilize", description: "Fertilize with an acidic soil fertilizer once in early spring", active_months: [4], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back lightly to shape the plant after flowering", active_months: [6], intervalInDays: 365)
    ]),

    Plant(id: 13, name: "Magnolia", plural: "Magnolias", imgName: "magnolia", growingConditions: [
        "Full sunlight",
        "Partial sunlight",
        "Fertile soil"
    ], chores: [
        Chore(name: "Water", description: "Water deeply during dry periods, especially for young trees", active_months: [5, 6, 7, 8, 9], intervalInDays: 10),
        Chore(name: "Fertilize", description: "Apply slow-release fertilizer once in early spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back any dead or damaged branches in late winter", active_months: [2, 3], intervalInDays: 365)
    ]),

    Plant(id: 14, name: "Pasque Flower", plural: "Pasque Flowers", imgName: "pasqueflower", growingConditions: [
        "Partial shade",
        "Dry soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water sparingly, as it tolerates drought", active_months: [3, 4, 5], intervalInDays: 10),
        Chore(name: "Fertilize", description: "Apply compost or organic fertilizer once in early spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back stems after flowering in late spring", active_months: [5], intervalInDays: 365)
    ]),

    Plant(id: 15, name: "Peony", plural: "Peonies", imgName: "peony", growingConditions: [
        "Full sunlight",
        "Moist soil",
        "Fertile soil"
    ], chores: [
        Chore(name: "Water", description: "Water deeply once a week during dry periods", active_months: [5, 6, 7, 8], intervalInDays: 7),
        Chore(name: "Fertilize", description: "Fertilize with a balanced fertilizer once in spring", active_months: [3, 4], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back foliage in late autumn to prevent disease", active_months: [10, 11], intervalInDays: 365)
    ]),

    Plant(id: 16, name: "Rhododendron", plural: "Rhododendrons", imgName: "rhododendron", growingConditions: [
        "Partial shade",
        "Acidic soil",
        "Moist soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly to maintain moist soil, especially in hot weather", active_months: [4, 5, 6, 7, 8], intervalInDays: 7),
        Chore(name: "Fertilize", description: "Fertilize with an acidic fertilizer once in early spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut back dead blooms after flowering", active_months: [5, 6, 7], intervalInDays: 365)
    ]),

    Plant(id: 17, name: "Rose", plural: "Roses", imgName: "rose", growingConditions: [
        "Full sunlight",
        "Partial sunlight",
        "All soil types"
    ], chores: [
        Chore(name: "Water", description: "Water once every 8 days for the entire year", active_months: all_months, intervalInDays: 8),
        Chore(name: "Fertilize", description: "Fertilize once per month during summer", active_months: [5, 6, 7, 8], intervalInDays: 30),
        Chore(name: "Cut", description: "Cut rose buds after they have bloomed", active_months: [5, 6, 7, 8, 9, 10], intervalInDays: 7)
    ]),

    Plant(id: 18, name: "Rose of Sharon", plural: "Roses of Sharon", imgName: "rose_of_Sharon", growingConditions: [
        "Full sunlight",
        "Moist soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly during dry periods, but avoid waterlogging", active_months: [5, 6, 7, 8, 9], intervalInDays: 10),
        Chore(name: "Fertilize", description: "Fertilize once a month during the growing season", active_months: [5, 6, 7, 8], intervalInDays: 30),
        Chore(name: "Cut", description: "Cut back the bush in early spring to shape and promote new growth", active_months: [3, 4], intervalInDays: 365)
    ]),

    Plant(id: 19, name: "Rudbeckia", plural: "Rudbeckias", imgName: "rudbeckia", growingConditions: [
        "Full sunlight",
        "Moist soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly to keep the soil moist, especially during the growing season", active_months: [5, 6, 7, 8], intervalInDays: 7),
        Chore(name: "Fertilize", description: "Fertilize once a month with a balanced fertilizer", active_months: [5, 6, 7, 8], intervalInDays: 30),
        Chore(name: "Cut", description: "Cut back after flowering to encourage new blooms", active_months: [9, 10], intervalInDays: 365)
    ]),

    Plant(id: 20, name: "Tomato", plural: "Tomatoes", imgName: "tomato", growingConditions: [
        "Full sunlight",
        "Fertile soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water regularly, ensuring the soil is evenly moist but not waterlogged", active_months: [4, 5, 6, 7, 8], intervalInDays: 3),
        Chore(name: "Fertilize", description: "Fertilize every 2 weeks during the growing season with a balanced fertilizer", active_months: [5, 6, 7, 8], intervalInDays: 14),
        Chore(name: "Cut", description: "Cut back any side shoots (suckers) to encourage better fruit growth", active_months: [5, 6, 7, 8], intervalInDays: 14)
    ]),

    Plant(id: 21, name: "Tulip", plural: "Tulips", imgName: "tulip", growingConditions: [
        "Full sunlight",
        "Well-drained soil",
        "All soil types"
    ], chores: [
        Chore(name: "Water", description: "Water after planting bulbs and during flowering", active_months: [3, 4, 5], intervalInDays: 7),
        Chore(name: "Fertilize", description: "Fertilize with bulb fertilizer once in early spring", active_months: [3], intervalInDays: 365),
        Chore(name: "Cut", description: "Cut the blooms after they have finished flowering", active_months: [5], intervalInDays: 365)
    ]),

    Plant(id: 22, name: "Zucchini", plural: "Zucchinis", imgName: "zucchini", growingConditions: [
        "Full sunlight",
        "Fertile soil",
        "Well-drained soil"
    ], chores: [
        Chore(name: "Water", description: "Water deeply and regularly during dry periods", active_months: [5, 6, 7, 8], intervalInDays: 3),
        Chore(name: "Fertilize", description: "Fertilize once a month during the growing season with balanced fertilizer", active_months: [5, 6, 7, 8], intervalInDays: 30),
        Chore(name: "Cut", description: "Cut back any diseased or damaged leaves to maintain plant health", active_months: [5, 6, 7, 8], intervalInDays: 14)
    ]),
]


func get_plant(id :Int) -> Plant {
    return plants[id];
}
