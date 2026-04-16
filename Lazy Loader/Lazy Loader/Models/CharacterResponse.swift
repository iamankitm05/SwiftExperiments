//
//  CharacterResponse.swift
//  Lazy Loader
//
//  Created by Ankit Kumar Ojha on 16/04/26.
//

import SwiftUI

struct CharacterResponse: Codable {
    let results: [Character]
    let count: Int
    let pages: Int
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
        case info = "info"
    }
    
    private enum InfoKeys: String, CodingKey {
        case count, pages
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let infoContainer = try container.nestedContainer(keyedBy: InfoKeys.self, forKey: .info)
        
        self.count = try infoContainer.decode(Int.self, forKey: .count)
        self.pages = try infoContainer.decode(Int.self, forKey: .pages)
        self.results = try container.decode([Character].self, forKey: .results)
    }
}

