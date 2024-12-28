//
//  FlowerList.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 05/12/2024.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Get inspired!")
                        .font(.title)
                    Text("Discover the most popular plants")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(5)
                .background(Color.LightGreen)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                FlowerList(plants: plants)
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
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Favorites())
    }
}
