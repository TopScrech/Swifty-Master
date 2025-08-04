import SwiftUI

struct TopicBadges: View {
    @State private var isOn = true
    @State private var number = 16
    
    private let center = UNUserNotificationCenter.current()
    
    var body: some View {
        VStack(spacing: 25) {
            Stepper("Change badge number to \(number)", value: $number)
                .numericTransition()
                .animation(.default, value: number)
            
            HStack {
                Button("Change") {
                    changeBadgeNumber(number)
                }
                
                Button("Reset") {
                    changeBadgeNumber(0)
                }
            }
            
            CodeBlockView(.badges)
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
    TopicBadges()
        .darkSchemePreferred()
}
