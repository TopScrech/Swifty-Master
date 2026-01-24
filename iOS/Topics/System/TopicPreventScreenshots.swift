import ScrechKit

struct TopicPreventScreenshots: View {
    @State private var preventScreenshots = true

    var body: some View {
        VStack(spacing: 25) {
            Text("Use a secure text entry mask to discourage screenshots of sensitive UI")

#if os(iOS)
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 12) {
                    Label("API Key", systemImage: "key.fill")
                        .font(.headline)

                    Text("sk_live_49Y2K-9A90-1B2C")
                        .monospaced()
                        .secondary()

                    Divider()

                    Label("Recovery Code", systemImage: "lock.shield")
                        .font(.headline)

                    Text("RC-3910-8842")
                        .monospaced()
                        .secondary()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thinMaterial, in: .rect(cornerRadius: 16))
                .screenshotPreventingMask(preventScreenshots)

                Toggle("Prevent screenshots", isOn: $preventScreenshots)
                    .padding()
                    .glassyBackground(16)
            }

            Text("This UIKit technique can reduce screenshots but is not a guarantee")
                .footnote()
                .secondary()
                .multilineTextAlignment(.center)
#else
            TopicWarning("Screenshot masking is available on iOS only")
#endif

            CodeBlockView(.preventScreenshots)
        }
    }
}

#Preview {
    TopicPreventScreenshots()
        .darkSchemePreferred()
}
