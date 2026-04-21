//
//  CharactersViewModel.swift
//  Lazy Loader
//
//  Created by Ankit Kumar Ojha on 16/04/26.
//

import Combine

@MainActor
class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var isLoadingMore: Bool = false
    @Published var error: Error?
    @Published var page: Int = 1
    @Published var pages = 0
    @Published var isRefreshing: Bool = false
    @Published var hasMorePages: Bool = true
    
    private let rickAndMortyAPIService = RickAndMortyAPIService()
    
    func loadCharacters(isRefresh: Bool = false) async {
        if isRefresh {
            guard !isRefreshing else { return }
            isRefreshing = true
        } else {
            guard !isLoading else { return }
            isLoading = true
        }
        
        error = nil
        page = 1
        hasMorePages = true
        
        // 👇 Only clear data when refreshing OR first load
        if isRefresh || characters.isEmpty {
            characters.removeAll()
        }
        
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000) // testing delay
            
            let response = try await rickAndMortyAPIService.getCharacters(page: page)
            
            characters = response.results
            pages = response.pages
            hasMorePages = page < pages
            
        } catch {
            self.error = error
        }
        
        isLoading = false
        isRefreshing = false
    }
    
    func loadMoreCharacters() async {
        guard !isLoadingMore, hasMorePages else { return }
        
        isLoadingMore = true
        
        do {
            page += 1
            let response = try await rickAndMortyAPIService.getCharacters(page: page)
            
            characters.append(contentsOf: response.results)
            pages = response.pages
            hasMorePages = page < pages
            
        } catch {
            self.error = error
        }
        
        isLoadingMore = false
    }
    
    func shouldLoadMore(currentItem: Character) -> Bool {
        guard let index = characters.firstIndex(where: { $0.id == currentItem.id }) else {
            return false
        }
        
        return index >= characters.count - 3
    }
}
