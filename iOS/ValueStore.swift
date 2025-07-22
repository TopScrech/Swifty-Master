import SwiftUI

final class ValueStore: ObservableObject {
    @AppStorage("color_theme") var colorTheme: ColorTheme = .system
}
