//
//  Scaffold.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 11/12/2024.
//

import Foundation
import SwiftUI

struct RootView :View {
    @State private var selectedTab = 0;
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Plant Guard")
                    .font(.title)
                Text("Your green companion")
                    .foregroundColor(Color.DarkGreen)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem { Image(systemName: "house") }
                    .tag(0)
                
                SearchView()
                    .tabItem { Image(systemName: "magnifyingglass") }
                    .tag(1)
                
                FavoritesView()
                    .tabItem { Image(systemName: "heart") }
                    .tag(2)
                
                CalendarView()
                    .tabItem { Image(systemName: "calendar") }
                    .tag(2)
            }
        }
        .background(Color.Green)
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.LightGreen)
    }
}




struct Scaffold_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(Favorites())
    }
}
