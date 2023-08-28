
import Foundation
import SwiftUI

@available(iOS 15.0, *)
public struct HorizontalPickerView: View {
    
    @Binding var offset: CGFloat
    
    public let minValue: Int
    public let maxValue: Int
    public var pickerCount: Int {
        let doubleValue: Double = ceil((Double(maxValue) - Double(minValue) - 1.0) / 5.0)
        return Int(doubleValue)
    }
    
    public init(offset: Binding<CGFloat>, minValue: Int, maxValue: Int) {
        self._offset = offset
        self.minValue = minValue
        self.maxValue = maxValue
    }
    
    public var body: some View {
        HorizontalPickerUIKitView(pickerCount: pickerCount, offset: $offset) {
            HStack(spacing: 0) {
                
                ForEach(1...pickerCount, id: \.self) { index in
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 1, height: 30)
                        .frame(width: 20)
                    
                    ForEach(1...4, id: \.self) { subIndex in
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 1, height: 15)
                            .frame(width: 20)
                    }
                }
                
                Rectangle()
                    .fill(.gray)
                    .frame(width: 1, height: 30)
                    .frame(width: 20)
                
            }
            .offset(x: (UIScreen.main.bounds.width - 30) / 2)
            .padding(.trailing, UIScreen.main.bounds.width - 30)
        }
        .frame(height: 50)
        .overlay {
            
            Rectangle()
                .fill(.gray)
                .frame(width: 1, height: 50)
                .offset(x: 1, y: -30)
        }
    }
}
