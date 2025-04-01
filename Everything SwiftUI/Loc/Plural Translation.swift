import ScrechKit

struct PluralTranslation: View {
    private let days = [1, 2, 5]
    
    var body: some View {
        List {
            ForEach(days, id: \.self) { days in
                Text("\(days) days ago")
            }
            
            Section {
                Button {
                    openSettings()
                } label: {
                    Label("Open Settings", systemImage: "gear")
                }
            }
        }
    }
}

#Preview {
    PluralTranslation()
}
