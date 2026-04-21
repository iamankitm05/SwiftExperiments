import Foundation

class RickAndMortyAPIService {
    func getCharacters(page: Int = 1) async throws -> CharacterResponse {
        let url = APIEndPoints.getCharacters(page: page).url
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidStatusCode(httpResponse.statusCode)
            }
            
            do {
                let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
                return decoded
            } catch {
                throw APIError.decodingError
            }
        } catch {
            throw APIError.unknown(error)
        }
    }
}
