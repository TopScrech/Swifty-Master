import SwiftUI

struct TopicBadges: View {
    @State private var number = 0
    
    private let center = UNUserNotificationCenter.current()
    
    var body: some View {
        VStack(spacing: 25) {
            Stepper(value: $number, in: 0...100) {
                Text("Change badge number to \(number)")
                
                Text("Check the app icon on the home screen")
                    .footnote()
            }
            .numericTransition(number)
            .animation(.default, value: number)
            .padding(10)
            .glassyBackground(16)
            
            CodeBlockView(.badges)
            
            TopicHeading("Badge over app icon")
            
            Text("⚠️ Note that the notifications permission is required")
            
            CodeBlockView(.badgeOverAppIcon)
        }
        .onChange(of: number) { _, new in
            changeBadgeNumber(new)
        }
    }
    
    private func changeBadgeNumber(_ new: Int) {
        requestPermission()
        
        Task {
            do {
                try await center.setBadgeCount(new)
            } catch {
                print(error)
            }
        }
    }
    
    private func requestPermission() {
        center.requestAuthorization(options: .badge) { _, _ in }
    }
}

#Preview {
    ScrollView {
        ContentView(.badges)
    }
    .darkSchemePreferred()
    .environmentObject(ValueStore())
}
