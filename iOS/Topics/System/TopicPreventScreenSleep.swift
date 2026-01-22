import ScrechKit
#if canImport(UIKit)
import UIKit
#endif

struct TopicPreventScreenSleep: View {
    @State private var keepScreenAwake = false

    var body: some View {
        VStack(spacing: 25) {
            Text("Disable the idle timer to keep the screen awake during timers, workouts, or reading modes")

#if os(iOS)
            Toggle("Keep screen awake", isOn: $keepScreenAwake)
                .padding()
                .glassyBackground(16)
                .onChange(of: keepScreenAwake) { _, newValue in
                    UIApplication.shared.isIdleTimerDisabled = newValue
                }
                .onAppear {
                    keepScreenAwake = UIApplication.shared.isIdleTimerDisabled
                }
                .onDisappear {
                    UIApplication.shared.isIdleTimerDisabled = false
                }

            Text("Turn this back off when you no longer need it to avoid extra battery drain")
                .footnote()
                .secondary()
                .multilineTextAlignment(.center)
#else
            TopicWarning("Idle timer control is available on iOS only")
#endif

            CodeBlockView(.preventScreenSleep)
        }
    }
}

#Preview {
    TopicPreventScreenSleep()
        .darkSchemePreferred()
}
