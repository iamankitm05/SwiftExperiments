import SwiftUI

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
}

extension Character {
    static let mock = Character(
        id: 1,
        name: "Luke Skywalker",
        species: "Human",
        gender: "Male",
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    )
    
    static let characters: [Character] = [
        mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock,
        mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock, mock,
    ]
}
