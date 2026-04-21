import Foundation

enum APIEndPoints {
    case getCharacters(page: Int)
}

extension APIEndPoints {
    var url: URL {
        var components = URLComponents()
           components.scheme = "https"
           components.host = "rickandmortyapi.com"
        
        switch self {
        case .getCharacters(let page):
               components.path = "/api/character"
               components.queryItems = [
                   URLQueryItem(name: "page", value: "\(page)")
               ]
        }
        
        return components.url!;
    }
}
