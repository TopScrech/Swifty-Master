import SwiftUI

struct TopicDetectOSVersion: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Detecting the OS version involves using #available to check if the current version is x or higher, allowing conditional code execution based on the platform's capabilities")
            
            CodeBlockView(.detectOSVersion)
            
            CodeBlockView(.detectOSVersionNewAndOld)
        }
    }
}

#Preview {
    TopicDetectOSVersion()
}
