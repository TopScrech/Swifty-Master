// A navigation model used to persist and restore the navigation state

import SwiftUI

@Observable
final class NavModel: Codable {
    /// The selected topic category; otherwise returns `nil`
    var selectedCategory: Category?
    
    /// The homogenous navigation state used by the app's navigation stacks
    var topicPath: [Topic]
    
    /// The leading columns' visibility state used by the app's navigation split views
    var columnVisibility: NavigationSplitViewVisibility
    
    /// The leading columns' visibility state used by the app's navigation split views
    var showExperiencePicker = false
    
    private static let decoder = JSONDecoder()
    private static let encoder = JSONEncoder()
    
    /// The URL for the JSON file that stores the topic data
    private static var dataURL: URL {
        .cachesDirectory.appending(path: "NavigationData.json")
    }
    
    /// The shared singleton navigation model object
    static let shared = {
        if let model = try? NavModel(contentsOf: dataURL) {
            model
        } else {
            NavModel()
        }
    }()
    
    /// Initialize a `NavigationModel` that enables programmatic control of leading columns’ visibility,
    /// selected topic category, and navigation state based on topic data
    init(
        columnVisibility: NavigationSplitViewVisibility = .automatic,
        selectedCategory: Category? = nil,
        topicPath: [Topic] = []
    ) {
        self.columnVisibility = columnVisibility
        self.selectedCategory = selectedCategory
        self.topicPath = topicPath
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
            topicPath: model.topicPath
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
            topicPath = model.topicPath
            columnVisibility = model.columnVisibility
            
            print("Loaded NavModel \(topicPath)")
        } catch {
            print(error)
        }
    }
    
    /// Saves the JSON data for the NavModel
    func save() throws {
        try jsonData?.write(to: Self.dataURL)
        
        print("Saved nav path \(topicPath)")
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
            
            selectedCategory = model.selectedCategory
            topicPath = model.topicPath
            columnVisibility = model.columnVisibility
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.selectedCategory = try container.decodeIfPresent(Category.self, forKey: .selectedCategory)
        
        let topicIds = try container.decode([Topic.ID].self, forKey: .topicPathIds)
        
        self.topicPath = topicIds.compactMap {
            DataModel.shared[$0]
        }
        
        self.columnVisibility = try container.decode(NavigationSplitViewVisibility.self, forKey: .columnVisibility)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(selectedCategory, forKey: .selectedCategory)
        try container.encode(topicPath.map(\.id), forKey: .topicPathIds)
        try container.encode(columnVisibility, forKey: .columnVisibility)
    }
    
    private enum CodingKeys: String, CodingKey {
        case selectedCategory, topicPathIds, columnVisibility
    }
}
