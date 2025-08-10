import SwiftUI

struct NavModePicker: View {
    @EnvironmentObject private var store: ValueStore
    
    private let columns = [
        GridItem(.adaptive(minimum: 250))
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text("Choose your navigation mode")
                    .largeTitle(.bold)
                    .lineLimit(2, reservesSpace: true)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                    .padding()
                
                Spacer()
                
                LazyVGrid(columns: columns) {
                    ForEach(NavMode.allCases) { navMode in
                        NavModePickerItem(navMode)
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
        .interactiveDismissDisabled(store.navMode == nil)
    }
}

#Preview {
    NavModePicker()
        .environmentObject(ValueStore())
}
