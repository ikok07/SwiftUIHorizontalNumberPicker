// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation
import SwiftUI


@available(iOS 15.0, *)
struct HorizontalPickerUIKitView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    var pickerCount: Int
    
    init(pickerCount: Int, offset: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
        self.pickerCount = pickerCount
        self.content = content()
        self._offset = offset
    }
    
    func makeCoordinator() -> Coordinator {
        return HorizontalPickerUIKitView.Coordinator(parent: self)
    }
    
    public func makeUIView(context: Context) -> some UIScrollView {
        
        let scrollView = UIScrollView()
        
        let swiftUIView = UIHostingController(rootView: content).view!
        
        let width = CGFloat(((pickerCount * 5) * 20)) + (UIScreen.main.bounds.width - 30)
        
        swiftUIView.frame = CGRect(x: 0, y: 0, width: width, height: 20)
        
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        return scrollView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: HorizontalPickerUIKitView
        
        init(parent: HorizontalPickerUIKitView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            
            let value = (offset / 20).rounded(.toNearestOrAwayFromZero)
            scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            
            if !decelerate {
                let offset = scrollView.contentOffset.x
                
                let value = (offset / 20).rounded(.toNearestOrAwayFromZero)
                scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: true)
            }
            
        }
        
    }
    
}

@available(iOS 15.0, *)
public struct HorizontalPickerView: View {
    
    @Binding var offset: CGFloat
    
    let minValue: Int
    let maxValue: Int
    var pickerCount: Int {
        let doubleValue: Double = ceil((Double(maxValue) - Double(minValue) - 1.0) / 5.0)
        return Int(doubleValue)
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
