//
//  Colors.swift
//  ultragarden
//
//  Created by Jakub Krzyzanowski on 05/12/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let LightGreen = Color(red: 230 / 255, green: 240 / 255, blue: 213 / 255);
    static let Green = Color(red: 180 / 255, green: 215 / 255, blue: 151 / 255);
    static let DarkGreen = Color(red: 7 / 255, green: 125 / 255, blue: 12 / 255);
    static let Gray = Color(red: 196 / 255, green: 199 / 255, blue: 190 / 255);
    static let LightGray = Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255);
}

struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner
    
    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius;
        self.corners = corners;
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
