
import Foundation
import SwiftUI

@available(iOS 15.0, *)
public struct HorizontalPickerView: View {
    
    @State private var offset: CGFloat
    @Binding var value: CGFloat
    
    public let minValue: Int
    public let maxValue: Int
    private var pickerCount: Int {
        let doubleValue: Double = ceil((Double(maxValue) - Double(minValue) - 1.0) / 5.0)
        return Int(doubleValue)
    }
    
    public init(value: Binding<CGFloat>, minValue: Int, maxValue: Int) {
        self.offset = 0
        self._value = value
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
        .onAppear {
            let progress = offset / 20
            
            self.value = CGFloat(minValue) + progress
        }
    }
}
