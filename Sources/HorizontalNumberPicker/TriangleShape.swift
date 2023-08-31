//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 31.08.23.
//

import SwiftUI

@available(iOS 13.0, *)
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.midY),
                          control: CGPoint(x: rect.minX, y: rect.minY))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control: CGPoint(x: rect.minX, y: rect.minY))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                          control: CGPoint(x: rect.maxX, y: rect.minY))
        
        path.closeSubpath()
        
        return path
    }
}
