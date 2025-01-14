//
//  ultragardenTests.swift
//  ultragardenTests
//
//  Created by Jakub Krzyzanowski on 05/12/2024.
//

import XCTest
@testable import ultragarden

class ultragardenTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setupOnePlant() {
        plants = [Plant(id: 0, name: "Anemone", plural: "Anemones", imgName: "anemone", growingConditions: ["Partial shade", "Moist soil", "Humus-rich soil"], chores: [
            Chore(name: "Water", description: "water plants", active_months: all_months, intervalInDays: 1)
        ])]
    }
    
    func setupOnePlantInactiveChore() {
        plants = [Plant(id: 0, name: "Anemone", plural: "Anemones", imgName: "anemone", growingConditions: ["Partial shade", "Moist soil", "Humus-rich soil"], chores: [
            Chore(name: "Water", description: "water plants", active_months: [], intervalInDays: 1)
        ])]
    }

    func testAddPlantEntry() {
        setupOnePlant()
        XCTAssertTrue(plants.count == 1)
        let calendar = Calendar()

        calendar.add_to_calendar(id: 0, date_added: Date(), count: 3)

        let entries = calendar.get_all_entries()
        XCTAssertTrue(entries.count == 1)
        XCTAssertTrue(entries[0].plant.id == 0)
        XCTAssertTrue(entries[0].count == 3)
    }
    
    func testRemovePlantEntry() {
        setupOnePlant()
        XCTAssertTrue(plants.count == 1)
        let calendar = Calendar()

        calendar.add_to_calendar(id: 0, date_added: Date(), count: 3)
        calendar.remove_from_calendar(id: 0)

        let entries = calendar.get_all_entries()
        XCTAssertTrue(entries.count == 0)
    }
    
    func testIsInCalendar() {
        setupOnePlant()
        XCTAssertTrue(plants.count == 1)
        let calendar = Calendar()
        
        XCTAssertTrue(calendar.is_in_calendar(id: 0) == false)
        calendar.add_to_calendar(id: 0, date_added: Date(), count: 3)
        XCTAssertTrue(calendar.is_in_calendar(id: 0) == true)
        calendar.remove_from_calendar(id: 0)
        XCTAssertTrue(calendar.is_in_calendar(id: 0) == false)
    }
    
    func whenPlantIsRemoved__ChoreIsRemoved() {
        setupOnePlant()
        let calendar = Calendar()
        
        calendar.add_to_calendar(id: 0, date_added: Date(), count: 1)
        XCTAssertTrue(calendar.get_all_chores().count == 1)
        calendar.remove_from_calendar(id: 0)
        XCTAssertTrue(calendar.get_all_chores().count == 0)
    }
    
    
    

}

func to_date(_ dateStr: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: dateStr)!
}

func compare_dates(_ d1: Date, _ d2: Date) -> Bool {
    let calendar = Calendar.current
    return calendar.isDate(d1, inSameDayAs: d2)
}

// Your test case class
class DateTests: XCTestCase {

    // Test 1: Basic test with a single active month (March)
    func testSingleActiveMonth() {
        let startDate = to_date("2025-01-01")
        let activeMonths = [3] // Only March is active
        let interval = 30
        let expected = to_date("2025-03-02")
        
        let result = Calendar().get_next_due_date(date: startDate, intervalInDays: interval, active_months: activeMonths)
        XCTAssertTrue(compare_dates(result, expected), "Test failed: Expected \(expected), but got \(result).")
    }

    // Test 2: No active months (should return high date)
    func testNoActiveMonths() {
        let startDate = to_date("2025-01-01")
        let activeMonths: [Int] = [] // No active months
        let interval = 15
        let expected = Calendar().get_hight_date() // Should return the high date (2100-01-01)
        
        let result = Calendar().get_next_due_date(date: startDate, intervalInDays: interval, active_months: activeMonths)
        XCTAssertTrue(compare_dates(result, expected), "Test failed: Expected the high date, but got \(result).")
    }

    // Test 3: Multiple active months (March and June)
    func testMultipleActiveMonths() {
        let startDate = to_date("2025-01-01")
        let activeMonths = [3, 6] // March and June are active
        let interval = 30
        let expected = to_date("2025-03-02") // Should land on March 1st
        
        let result = Calendar().get_next_due_date(date: startDate, intervalInDays: interval, active_months: activeMonths)
        XCTAssertTrue(compare_dates(result, expected), "Test failed: Expected \(expected), but got \(result).")
    }

    // Test 4: Multiple intervals where it skips non-active months
    func testMultipleIntervalsSkippingMonths() {
        let startDate = to_date("2025-01-01")
        let activeMonths = [3, 5] // March and May are active
        let interval = 60
        let expected1 = to_date("2025-03-02") // First 60 days lands on March 1st
        let expected2 = to_date("2025-05-01") // Second interval lands on May 1st
        
        let result1 = Calendar().get_next_due_date(date: startDate, intervalInDays: interval, active_months: activeMonths)
        XCTAssertTrue(compare_dates(result1, expected1), "Test failed: Expected \(expected1), but got \(result1).")
        
        let result2 = Calendar().get_next_due_date(date: result1, intervalInDays: interval, active_months: activeMonths)
        XCTAssertTrue(compare_dates(result2, expected2), "Test failed: Expected \(expected2), but got \(result2).")
    }

    // Test 5: Date falls into a month that's not active (should skip to next active month)
    func testSkipInactiveMonth() {
        let startDate = to_date("2025-04-01")
        let activeMonths = [3, 5] // Only March and May are active
        let interval = 30
        let expected = to_date("2025-05-01") // Should skip April and land on May 1st
        
        let result = Calendar().get_next_due_date(date: startDate, intervalInDays: interval, active_months: activeMonths)
        XCTAssertTrue(compare_dates(result, expected), "Test failed: Expected \(expected), but got \(result).")
    }
}
