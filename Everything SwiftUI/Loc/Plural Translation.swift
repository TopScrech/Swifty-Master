import ScrechKit

struct PluralTranslation: View {
    private let days = [1, 2, 5]
    
    var body: some View {
        List {
            ForEach(days, id: \.self) { days in
                Text("\(days) days ago")
            }
            
            Section {
                Button("Open Settings", systemImage: "gear") {
                    openSettings()
                }
            }
        }
    }
}

#Preview {
    PluralTranslation()
}
