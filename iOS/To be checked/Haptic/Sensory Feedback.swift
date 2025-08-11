import SwiftUI

struct FeedbackView: View {
    private let feedbacks: [String: SensoryFeedback] = [
        "alignment":    .alignment,
        "decrease":     .decrease,
        "error":        .error,
        "impact":       .impact,
        "increase":     .increase,
        "levelChange":  .levelChange,
        "selection":    .selection,
        "start":        .start,
        "stop":         .stop,
        "success":      .success,
        "warning":      .warning,
        //        .impact(flexibility: .)
    ]
    
    var body: some View {
        VStack {
            ForEach(feedbacks.keys.sorted(), id: \.self) { key in
                FeedbackButton(key, feedback: feedbacks[key]!)
            }
        }
    }
}

struct FeedbackButton: View {
    private let name: String
    private let feedback: SensoryFeedback
    
    init(_ name: String, feedback: SensoryFeedback) {
        self.name = name
        self.feedback = feedback
    }
    
    @State private var trigger = false
    
    var body: some View {
        Button(name) {
            trigger.toggle()
        }
        .padding()
        .sensoryFeedback(feedback, trigger: trigger)
    }
}

#Preview {
    FeedbackView()
}
