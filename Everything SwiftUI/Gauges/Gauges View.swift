import ScrechKit

struct GaugesView: View {
    var body: some View {
        VStack(spacing: 32) {
            GaugeCard("accessoryCircular") {
                Gauge(value: 50, in: 0...100) {
                    Text("C")
                }
                .gaugeStyle(.accessoryCircular)
                .tint(.red)
            }
            
            GaugeCard("accessoryCircularCapacity") {
                Gauge(value: 50, in: 0...100) {}
                    .gaugeStyle(.accessoryCircularCapacity)
                    .tint(.green)
            }
            
            GaugeCard("linearCapacity") {
                Gauge(value: 90, in: 0...100) {}
                    .gaugeStyle(.linearCapacity)
            }
            
            GaugeCard("accessoryLinear") {
                Gauge(value: 10, in: 0...100) {}
                    .gaugeStyle(.accessoryLinear)
            }
            
            GaugeCard("accessoryLinearCapacity") {
                Gauge(value: 10, in: 0...100) {}
                    .gaugeStyle(.accessoryLinearCapacity)
                    .opacity(0.7)
                    .tint(.brown)
            }
        }
        .padding(.horizontal)
        .codeBlock(.gauges)
    }
}

#Preview {
    NavigationView {
        GaugesView()
    }
    .darkSchemePreferred()
}
