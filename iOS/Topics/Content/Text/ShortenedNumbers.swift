import SwiftUI

struct ShortenedNumbers: View {
    private let numbers = [16000, 16000000, 16000000000, 16000000000000]
    
    var body: some View {
        TopicDisclosureGroup("Shortened numbers") {
            CodeBlockView(.textShortenedNumbers)
            
            VStack {
                ForEach(numbers, id: \.self) { number in
                    HStack {
                        Text(number)
                            .frame(width: 160, alignment: .leading)
                        
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
    ShortenedNumbers()
}
