import SwiftUI

struct GaugeCard<GaugeContent: View>: View {
    private let name: String
    private let gauge: () -> GaugeContent
    
    init(_ name: String, gauge: @escaping () -> GaugeContent) {
        self.name = name
        self.gauge = gauge
    }
    
    var body: some View {
        VStack {
            Text(name)
            
            gauge()
        }
    }
}
