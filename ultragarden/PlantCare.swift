//
//  PlantCare.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 18/12/2024.
//

import SwiftUI

struct PlantCare: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Plant guard")
                .font(.largeTitle)
            Text("Your green companion")
                .foregroundColor(Color.DarkGreen)
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: VerticalAlignment.top) {
                    Image(systemName: "star.fill")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 120.0, height: 200.0)
                        .background(Color.DarkGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 40.0, height: 40.0)
                                .foregroundColor(Color.DarkGreen)
                        }
                        Text("Rose")
                            .font(.largeTitle)
                            .padding(30)
                            .frame(maxWidth: .infinity)
                            .background(Color.Green)
                            .clipShape(RoundedCorner(radius: 20, corners: [.topRight, .bottomRight]))
                    }
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("How to water?")
                        .font(.title)
                        .padding(.top, 10.0)
                    Divider()
                        .frame(height: 3)
                        .overlay(Color.Green)
                        .padding(0)
                    Text("5l once a week")
                        .padding(.bottom, 10)
                    Button(action: {}) {
                        Text("Add to calendar")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.Green)
                    .foregroundColor(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                    Text("How to fertilize?")
                        .font(.title)
                        .padding(.top, 10.0)
                    Divider()
                        .frame(height: 3)
                        .overlay(Color.Green)
                        .padding(0)
                    Text("once a month in the growing season")
                        .padding(.bottom, 10)
                    Button(action: {}) {
                        Text("Remove from calendar")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.Gray)
                    .foregroundColor(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    Button(action: {}) {
                        ZStack {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .padding(.horizontal, 20)
                                Spacer()
                            }
                            Text("Back")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(Color.Gray)
                    .foregroundColor(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
                    Spacer()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            .background(Color.LightGreen)
            .clipShape(RoundedRectangle(cornerRadius: 15));
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Green)
        
    }
}

struct PlantCare_Previews: PreviewProvider {
    static var previews: some View {
        PlantCare();
    }
}
