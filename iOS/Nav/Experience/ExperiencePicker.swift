import SwiftUI

struct ExperiencePicker: View {
    @Binding var experience: Experience?
    
    @State private var selection: Experience?
    
    init(_ experience: Binding<Experience?>) {
        _experience = experience
    }
    
    private let columns = [
        GridItem(.adaptive(minimum: 250))
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Choose your navigation experience")
                    .largeTitle(.bold)
                    .lineLimit(2, reservesSpace: true)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                    .padding()
                
                Spacer()
                
                LazyVGrid(columns: columns) {
                    ForEach(Experience.allCases) { experience in
                        ExperiencePickerItem($selection, experience: experience)
                    }
                }
                
                Spacer()
            }
            .scenePadding()
        }
#if os(macOS)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        .frame(width: 600, height: 350)
#endif
        .interactiveDismissDisabled(selection == nil)
    }
}

#Preview {
    @Previewable @State var selectedExperience: Experience? = .stack
    
    ExperiencePicker($selectedExperience)
}
