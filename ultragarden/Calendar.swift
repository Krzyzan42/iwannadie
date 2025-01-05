//
//  Calendar.swift
//  ultragarden
//
//  Created by Flow on 04.01.2025.
//

import Foundation

class Calendar :ObservableObject {
    @Published private var entries: [PlantEntry] = []

    init() {
        add_to_calendar(id: 0, date_added: Date(), count: 5)
        add_to_calendar(id: 1, date_added: Date(), count: 1)
        add_to_calendar(id: 3, date_added: Date(), count: 10)
    }

    func add_to_calendar(id :Int, date_added :Date, count :Int) -> Void {
        if is_in_calendar(id: id) {
            return
        }

        var plant = get_plant(id: id)

        var chore_entries: [ChoreEntry] = []
        for chore in plant.chores {
            chore_entries.append(
                ChoreEntry(name: chore.name, next_due_date: date_added, active_months: chore.active_months, intervalInDays: chore.intervalInDays)
            )
        }

        entries.append(PlantEntry(plant: plant, count: count, chores: chore_entries))
    
        objectWillChange.send()
    }

    func remove_from_calendar(id :Int) -> Void {
        if let index = entries.firstIndex(where: { $0.plant.id == id }) {
            entries.remove(at: index)
        }
        objectWillChange.send()
    }

    func is_in_calendar(id :Int) -> Bool {
        if let index = entries.firstIndex(where: { $0.plant.id == id }) {
            return true
        } else {
            return false
        }
    }

    func get_all_entries() -> [PlantEntry] {
        return entries
    }
}

class PlantEntry {
    var id = UUID() // For ForEach
    var plant :Plant
    var count :Int
    var chores :[ChoreEntry]

    init(plant :Plant, count :Int, chores :[ChoreEntry]) {
        self.plant = plant
        self.count = count
        self.chores = chores
    }
}

class ChoreEntry :ObservableObject {
    var id = UUID() // For ForEach
    var name :String
    var active_months :[Int]
    var intervalInDays :Int
    @Published var next_due_date :Date

    init(name :String, next_due_date :Date, active_months: [Int], intervalInDays :Int) {
        self.name = name
        self.next_due_date = next_due_date
        self.active_months = active_months
        self.intervalInDays = intervalInDays
        if active_months == [] {
            self.next_due_date = get_hight_date()
        }
    }
    
    func mark_done() -> Void {
        if active_months == [] {
            return
        }

        let calendar = Foundation.Calendar.current
        next_due_date = calendar.date(byAdding: .day, value: intervalInDays, to: next_due_date)!
        while !active_months.contains(calendar.component(.month, from: next_due_date)) {
            next_due_date = calendar.date(byAdding: .day, value: intervalInDays, to: next_due_date)!
        }
        
        objectWillChange.send()
    }

    func get_next_due_date() -> Date {
        return Date()
    }

    func get_hight_date() -> Date {
        var components = DateComponents()
        components.year = 3000
        components.month = 12
        components.day = 31

        return Foundation.Calendar.current.date(from: components) ?? Date()
    }
}

func dates_equal(d1 :Date, d2: Date) -> Bool {
    let s1 = Foundation.Calendar.current.startOfDay(for: d1)
    let s2 = Foundation.Calendar.current.startOfDay(for: d2)
    return s1 == s2
}