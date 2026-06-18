import Foundation

nonisolated struct SFSymbolCatalog: Decodable, Sendable {
    let symbolCount: Int
    let categories: [SFSymbolCategory]
    let symbols: [SFSymbolEntry]
    
    nonisolated static func load() -> SFSymbolCatalog {
        guard let url = Bundle.main.url(forResource: "SFSymbolCatalog", withExtension: "json") else {
            return SFSymbolCatalog(symbolCount: 0, categories: [], symbols: [])
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(SFSymbolCatalog.self, from: data)
        } catch {
            return SFSymbolCatalog(symbolCount: 0, categories: [], symbols: [])
        }
    }
}
