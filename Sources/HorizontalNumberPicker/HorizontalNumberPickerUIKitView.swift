// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation
import SwiftUI


@available(iOS 17.0, *)
struct HorizontalPickerUIKitView<Content: View>: UIViewRepresentable {
    
    @Binding var offset: CGFloat
    
    var content: Content
    var pickerCount: Int
    var minValue: Int
    var startValue: Int
    
    init(pickerCount: Int, offset: Binding<CGFloat>, minValue: Int, startValue: Int, @ViewBuilder content: @escaping () -> Content) {
        self.pickerCount = pickerCount
        self.content = content()
        self.minValue = minValue
        self.startValue = startValue
        self._offset = offset
    }
    
    func makeCoordinator() -> Coordinator {
        return HorizontalPickerUIKitView.Coordinator(parent: self)
    }
    
    public func makeUIView(context: Context) -> some UIScrollView {
        
        let scrollView = UIScrollView()
        
        let swiftUIView = UIHostingController(rootView: content).view!
        
        let width = CGFloat(((pickerCount * 5) * 20)) + (UIScreen.main.bounds.width - 30)
        
        swiftUIView.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        scrollView.contentOffset.x = CGFloat(startValue - minValue)
        
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
            if parent.offset.truncatingRemainder(dividingBy: 20) == 0 {
                // play click sound
            }
            
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

