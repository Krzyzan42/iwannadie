//
//  ultragardenApp.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 05/12/2024.
//

import SwiftUI

@main
struct ultragardenApp: App {
    @StateObject var calendar = Calendar()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(calendar)
        }
    }
}
