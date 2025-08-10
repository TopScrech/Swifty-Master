import SwiftUI

struct TopicDetectDeviceUsed: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("UIDevice.current.userInterfaceIdiom returns the type of device your app is running on, allowing you to adjust the UI for different platforms")
            
            CodeBlockView(.detectDeviceUsed)
        }
    }
}

#Preview {
    TopicDetectDeviceUsed()
}
