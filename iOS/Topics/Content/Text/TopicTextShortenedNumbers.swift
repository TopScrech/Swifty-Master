import SwiftUI

struct TopicTextShortenedNumbers: View {
    private let numbers = [16000, 16000000, 16000000000, 16000000000000]
    
    var body: some View {
        TopicDisclosureGroup("Shortened numbers") {
            CodeBlockView(.textShortenedNumbers)
            
            VStack {
                ForEach(numbers, id: \.self) { number in
                    HStack {
                        Text(number)
                        
                        Spacer()
                        Text(number, format: .number.notation(.scientific))
                        
                        Spacer()
                        Text(number, format: .number.notation(.compactName))
                    }
                }
            }
            .padding()
            .glassyBackground()
        }
    }
}

#Preview {
    TopicTextShortenedNumbers()
}
