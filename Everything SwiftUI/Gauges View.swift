import SwiftUI

struct GaugesView: View {
    var body: some View {
        VStack {
            Text("accessoryCircular")
            
            Gauge(value: 50, in: 0...100) {
                Text("C")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.red)
            
            Text("accessoryCircularCapacity")
            
            Gauge(value: 50, in: 0...100) {
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.green)
            
            Text("linearCapacity")
            
            Gauge(value: 90, in: 0...100) {
            }
            .gaugeStyle(.linearCapacity)
            
            Text("accessoryLinear")
            
            Gauge(value: 10, in: 0...100) {
            }
            .gaugeStyle(.accessoryLinear)
            
            Text("accessoryLinearCapacity")
            
            Gauge(value: 10, in: 0...100) {
            }
            .gaugeStyle(.accessoryLinearCapacity)
            .opacity(0.7)
            .tint(.brown)
        }
    }
}

#Preview {
    GaugesView()
}
