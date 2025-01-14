//
//  Calendar.swift
//  ultragarden
//
//  Created by Flow on 04.01.2025.
//

import Foundation

class Calendar :ObservableObject {
    @Published private var entries: [PlantEntry] = []
    @Published private var chores: [ChoreEntry] = []

    func add_to_calendar(id :Int, date_added :Date, count :Int) -> Void {
        if is_in_calendar(id: id) {
            return
        }

        let plant = get_plant(id: id)
        
        var plant_entry = PlantEntry(plant: plant, count: count)

        for chore in plant.chores {
            chores.append(
                ChoreEntry(
                    id: UUID(),
                    name: chore.name,
                    plant: plant_entry,
                    active_months: chore.active_months,
                    intervalInDays: chore.intervalInDays,
                    next_due_date: date_added
                )
            )
        }
        entries.append(plant_entry)
    
        objectWillChange.send()
    }

    func remove_from_calendar(id :Int) -> Void {
        if let index = entries.firstIndex(where: { $0.plant.id == id }) {
            var plant_entry = entries.remove(at: index)
            var chores_to_remove :[ChoreEntry] = []
            for chore in chores {
                if chore.plant.plant.id == plant_entry.plant.id {
                    chores_to_remove.append(chore)
                }
            }
            chores.removeAll(where: { chore in
                chores_to_remove.contains( where: { c in c.id == chore.id } )
            })
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
    
    func mark_done(entry :ChoreEntry) {
        if entry.active_months == [] {
            return
        }

        let calendar = Foundation.Calendar.current
        var next_due_date = calendar.date(byAdding: .day, value: entry.intervalInDays, to: entry.next_due_date)!
        while !entry.active_months.contains(calendar.component(.month, from: next_due_date)) {
            next_due_date = calendar.date(byAdding: .day, value: entry.intervalInDays, to: next_due_date)!
        }
        
        var next_chore = ChoreEntry(name: entry.name, plant: entry.plant, active_months: entry.active_months, intervalInDays: entry.intervalInDays, next_due_date: next_due_date)
        chores.append(next_chore)

        if let index = chores.firstIndex(where: { $0.id == entry.id }) {
            chores.remove(at: index)
        }
        objectWillChange.send()
    }

    func get_all_entries() -> [PlantEntry] {
        return entries
    }
    
    func get_all_chores() -> [ChoreEntry] {
        return chores
    }
    
    func get_next_due_date(date :Date, intervalInDays :Int, active_months :[Int]) -> Date {
        if active_months == [] {
            return get_hight_date()
        }

        let calendar = Foundation.Calendar.current
        var next_due_date = calendar.date(byAdding: .day, value: intervalInDays, to: date)!
        while !active_months.contains(calendar.component(.month, from: next_due_date)) {
            next_due_date = calendar.date(byAdding: .day, value: intervalInDays, to: next_due_date)!
        }
        
        return next_due_date;
    }
    
    func get_hight_date() -> Date {
        var components = DateComponents()
        components.year = 3000
        components.month = 12
        components.day = 31

        return Foundation.Calendar.current.date(from: components) ?? Date()
    }
}

struct PlantEntry {
    var id = UUID() // For ForEach
    var plant :Plant
    var count :Int
}

struct ChoreEntry {
    var id = UUID() // For ForEach
    var name :String
    var plant :PlantEntry
    var active_months :[Int]
    var intervalInDays :Int
    var next_due_date :Date
}

func dates_equal(d1 :Date, d2: Date) -> Bool {
    let s1 = Foundation.Calendar.current.startOfDay(for: d1)
    let s2 = Foundation.Calendar.current.startOfDay(for: d2)
    return s1 == s2
}
