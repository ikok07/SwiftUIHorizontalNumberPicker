
import Foundation
import SwiftUI

@available(iOS 17.0, *)
public struct HorizontalPickerView: View {
    
    @State private var offset: CGFloat = 0
    @Binding var value: Int
    
    let selectorGradient: LinearGradient
    
    public let minValue: Int
    public let maxValue: Int
    public let startValue: Int
    private var pickerCount: Int {
        let doubleValue: Double = ceil((Double(maxValue) - Double(minValue) - 1.0) / 5.0)
        return Int(doubleValue)
    }
    
    public init(value: Binding<Int>, selectorGradient: LinearGradient = LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing), minValue: Int, maxValue: Int, startValue: Int) {
        self._value = value
        self.selectorGradient = selectorGradient
        self.minValue = minValue
        self.maxValue = maxValue
        self.startValue = startValue
    }
    
    public var body: some View {
        VStack {
            HorizontalPickerUIKitView(pickerCount: pickerCount, offset: $offset, minValue: self.minValue, startValue: self.startValue) {
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
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                        .frame(width: 20)
                    
                }
                .offset(x: UIScreen.main.bounds.width / 2)
                .padding(.trailing, UIScreen.main.bounds.width)
            }
            .frame(height: 50)
            .overlay {
                    Triangle()
                        .fill(selectorGradient)
                        .frame(width: 15, height: 15)
                        .rotationEffect(.degrees(180))
                        .offset(x: 1, y: -30)
                    
                    Rectangle()
                        .fill(selectorGradient)
                        .frame(width: 3, height: 30)
                        .offset(x: 1)
                    
                    Triangle()
                        .fill(selectorGradient)
                        .frame(width: 15, height: 15)
                        .offset(x: 1, y: 30)

                    
            }
            .onChange(of: self.offset) { oldValue, newValue in
                let progress = offset / 20
                
                self.value = Int(CGFloat(minValue) + progress)
            }
            .onAppear {
                offset = CGFloat(20 * (startValue - minValue))
                let progress = offset / 20
                    
                self.value = Int(CGFloat(minValue) + progress)
            }
            .padding()
            .sensoryFeedback(.selection, trigger: value)
        }
    }
}

@available(iOS 17.0.0, *)
struct Preview: PreviewProvider {
    static var previews: some View {
        HorizontalPickerView(value: .constant(20), minValue: 20, maxValue: 180, startValue: 20)
    }
}
