# ClukUI

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FPierreJanineh-com%2FClukUI%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/PierreJanineh-com/ClukUI)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FPierreJanineh-com%2FClukUI%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/PierreJanineh-com/ClukUI)

## Overview
ClukUI is a Swift package designed to provide elegant and easy-to-integrate clock visualizations for SwiftUI applications. Perfect for apps that require time-related components with a sleek and modern design.

## Features
- Customizable clock faces
- Support for both analog and digital formats
- Easy integration with SwiftUI
- Lightweight and optimized for performance
- Adaptive design for iOS, tvOS and macOS

## Requirements
- iOS 13.0+ / macOS 10.14+ / tvOS 13.0+
- Xcode 12.0+
- Swift 5.9+

## Installation
To install ClukUI, simply add it to your project as a Swift Package:

1. In Xcode, open your project and navigate to `File → Swift Packages → Add Package Dependency`.
2. Paste the repository URL: `https://github.com/PierreJanineh-com/ClukUI`
4. Select the version you want to use.

## Usage
```swift
import SwiftUI
import ClukUI

struct ContentView: View {
    var body: some View {
        ClukView(date: .now)
        ClukView() //With no value for default Date()
    }
}
```

## Current Development Status
### Version: `PRE-RELEASE`
**Developed Features:**
- **Basic Clock Visualization**: The package currently includes `ClukView`, a SwiftUI view that visualizes a simple analog clock. This view displays the current time with hour, minute, and second hands.
- **Customizability**: Users can customize the displayed time by passing a Date variable to ClukView.
- **Cross-Platform Support**: The clock visualization is compatible with iOS, tvOS, and macOS platforms, adhering to adaptive design principles for each platform.
- **Environment Integration**: Designed for seamless integration into SwiftUI applications.

**Code Implementation:**
- The package uses SwiftUI to create the clock visualization.
- A `@State` property for the current time allows the clock to be updated in real-time.
- Custom struct `ClukHand` is used to draw the clock hands.

## Future Development Roadmap
### Short-Term Goals:
- **Refinement of Current Features**: Enhance the visual appeal and accuracy of the analog clock. This could include smoothing the movement of the clock hands and adding options for different clock hand styles.
- **Improved Customizability**: Allow users to customize more aspects of the clock, such as hand colors, clock face design, seconds ticking, and adding tick marks or numbers.

### Mid-Term Goals:
- **Digital Clock Format**: Introduce an option to switch between analog and digital clock formats. This includes designing a digital clock face within the ClukView.
- **Complex Time Formats**: Support for different time formats, including 24-hour format and varying time zones.

### Long-Term Goals:
- **Additional Time-Related Components**: Develop more components such as countdown timers, stopwatches, and world clocks.
- **Interactive Features**: Add functionalities like setting alarms or timers directly from the clock interface.
- **Localization and Accessibility**: Ensure the package supports multiple languages and is accessible to users with disabilities.

## Contribution Opportunities
Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.
- **Design Contributions**: Graphics designers can contribute to creating various clock face designs and themes.
- **Feature Development**: Developers can contribute to implementing new features such as the digital clock format or additional time-related components and current open issues.
- **Testing and Feedback**: Users and developers are welcome to test the package in different scenarios and provide feedback for improvements.

## License
ClukUI is available under the MIT license. See the LICENSE file for more info.

## Contact
For support or queries, please reach out to clukui@pierrejanineh.com.
