// A navigation model used to persist and restore the navigation state

import SwiftUI

@Observable
final class NavModel: Codable {
    var selectedCategory: Category?
    
    /// The homogenous nav state used by the app's nav stacks
    var topicPath: [Topic]
    var favoriteTopicPath: [Topic]
    
    var columnVisibility: NavigationSplitViewVisibility
    
    var showNavModePicker = false
    
    private static let decoder = JSONDecoder()
    private static let encoder = JSONEncoder()
    
    /// The URL for the JSON file that stores the topic data
    private static var dataURL: URL {
        .cachesDirectory.appending(path: "NavigationData.json")
    }
    
    /// The shared singleton nav model object
    static let shared = {
        if let model = try? NavModel(contentsOf: dataURL) {
            model
        } else {
            NavModel()
        }
    }()
    
    /// Initialize a `NavModel` that enables programmatic control of leading columns’ visibility,
    /// selected topic category, and navigation state based on topic data
    init(
        columnVisibility: NavigationSplitViewVisibility = .automatic,
        selectedCategory: Category? = nil,
        topicPath: [Topic] = [],
        favoriteTopicPath: [Topic] = []
    ) {
        self.columnVisibility = columnVisibility
        self.selectedCategory = selectedCategory
        self.topicPath = topicPath
        self.favoriteTopicPath = favoriteTopicPath
    }
    
    /// Initialize a `DataModel` with the contents of a `URL`
    private convenience init(
        contentsOf url: URL,
        options: Data.ReadingOptions = .mappedIfSafe
    ) throws {
        let data = try Data(contentsOf: url, options: options)
        let model = try Self.decoder.decode(Self.self, from: data)
        
        self.init(
            columnVisibility: model.columnVisibility,
            selectedCategory: model.selectedCategory,
            topicPath: model.topicPath,
            favoriteTopicPath: model.favoriteTopicPath
        )
    }
    
    func clearNavCache() {
        do {
            try FileManager.default.removeItem(at: Self.dataURL)
        } catch {
            print(error)
        }
    }
    
    /// Loads the navigation data for the navigation model from a previously saved state
    func load() {
        do {
            let model = try NavModel(contentsOf: Self.dataURL)
            
            selectedCategory = model.selectedCategory
            columnVisibility = model.columnVisibility
            topicPath = model.topicPath
            favoriteTopicPath = model.favoriteTopicPath
            
            print("Loaded NavModel \(topicPath)")
        } catch {
            print(error)
        }
    }
    
    /// Saves the JSON data for the NavModel
    func save() {
        do {
            try jsonData?.write(to: Self.dataURL)
            
            print("Saved nav path \(topicPath)")
        } catch {
            print(error)
        }
    }
    
    //    /// The selected topic; otherwise returns `nil`
    //    var selectedTopic: Topic? {
    //        get {
    //            topicPath.first
    //        } set {
    //            topicPath = [newValue].compactMap { $0 }
    //        }
    //    }
    
    var selectedTopic: Set<Topic> {
        get {
            Set(topicPath)
        } set {
            topicPath = Array(newValue)
        }
    }
    
    var selectedFavoriteTopic: Set<Topic> {
        get {
            Set(favoriteTopicPath)
        } set {
            favoriteTopicPath = Array(newValue)
        }
    }
    
    /// The JSON data used to encode and decode the navigation model at its current state
    var jsonData: Data? {
        get {
            try? Self.encoder.encode(self)
        } set {
            guard
                let data = newValue,
                let model = try? Self.decoder.decode(Self.self, from: data)
            else {
                return
            }
            
            selectedCategory  = model.selectedCategory
            columnVisibility  = model.columnVisibility
            topicPath         = model.topicPath
            favoriteTopicPath = model.favoriteTopicPath
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.selectedCategory = try container.decodeIfPresent(Category.self, forKey: .selectedCategory)
        self.columnVisibility = try container.decode(NavigationSplitViewVisibility.self, forKey: .columnVisibility)
        
        let topicIds = try container.decode([Topic.ID].self, forKey: .topicPathIds)
        let favoriteTopicIds = try container.decode([Topic.ID].self, forKey: .favoriteTopicPathIds)
        
        self.topicPath = topicIds.compactMap {
            Topic(rawValue: $0)
        }
        
        self.favoriteTopicPath = favoriteTopicIds.compactMap {
            Topic(rawValue: $0)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(selectedCategory, forKey: .selectedCategory)
        try container.encode(columnVisibility, forKey: .columnVisibility)
        try container.encode(topicPath.map(\.id), forKey: .topicPathIds)
        try container.encode(favoriteTopicPath.map(\.id), forKey: .favoriteTopicPathIds)
    }
    
    private enum CodingKeys: String, CodingKey {
        case selectedCategory, topicPathIds, columnVisibility, favoriteTopicPathIds
    }
}
