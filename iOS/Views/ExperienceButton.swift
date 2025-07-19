// An button that presents the navigation experience picker when its action is invoked

import SwiftUI

struct ExperienceButton: View {
    @Environment(NavModel.self) private var nav
    
    var body: some View {
        Button("Experience", systemImage: "wand.and.stars") {
            nav.showExperiencePicker = true
        }
        .help("Choose your navigation experience")
    }
}

#Preview() {
    ExperienceButton()
        .environment(NavModel.shared)
}
