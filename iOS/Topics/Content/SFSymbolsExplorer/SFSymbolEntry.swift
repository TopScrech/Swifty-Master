nonisolated struct SFSymbolEntry: Decodable, Identifiable, Hashable, Sendable {
    let name: String
    let availability: String
    let categories: [String]
    let searchTerms: [String]
    let restriction: String?
    
    var id: String {
        name
    }
    
    var isRestricted: Bool {
        restriction != nil
    }
    
    nonisolated func matches(_ query: String) -> Bool {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedQuery.isEmpty else {
            return true
        }
        
        return name.localizedStandardContains(trimmedQuery) ||
        searchTerms.contains { $0.localizedStandardContains(trimmedQuery) }
    }
}
