import ScrechKit

struct SidebarCategoryRow: View {
    let category: Category
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: category.icon)
                    .headline()
                    .frame(width: 24)
                
                Text(category.localizedName)
                    .semibold()
                
                Spacer(minLength: 0)
            }
            .foregroundStyle(.foreground)
            .padding(.vertical, 7)
            .padding(.horizontal, 10)
            .background(isSelected ? .gray.opacity(0.2) : .clear, in: .rect(cornerRadius: 12))
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SidebarCategoryRow(category: .sfSymbols, isSelected: true) {}
        .padding()
}
