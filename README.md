# SwiftUIHorizontalNumberPicker

This package allows you to create fast horizontal number pickers. It works only in SwiftUI. 

Here is an example from my project:


![image](https://github.com/ikok07/SwiftUIHorizontalNumberPicker/assets/70591797/07b8b3af-198e-4ce0-9dde-71f05415ec33)

# Installation

1. You can download the package from the built in package manager tool in xcode using this link `https://github.com/ikok07/SwiftUIHorizontalNumberPicker.git`

# Usage

1. Add variables

```swift
@State private var dynamicValue: Int = 0
let minValue = 23
let maxValue = 75
```


2. Use variables in your code

```swift
VStack {
  Text("years")
      .font(.title2)
      .fontWeight(.bold)
  Text("\(dynamicValue)")
      .font(.system(size: 60))
      .fontWeight(.bold)
}
```

3. Create a new HorizontalPickerView instance in you view file

```swift

HorizontalPickerView(value: $dynamicValue, minValue: self.minValue, maxValue: self.maxValue)
```


