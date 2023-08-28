//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 28.08.23.
//

import Foundation

public struct HorizontalNumberPickerMethods {
    public func getValue(offset: CGFloat, minValue: Int) -> String {
        let progress = offset / 20
        
        return "\(minValue + (Int(progress)))"
    }
}
