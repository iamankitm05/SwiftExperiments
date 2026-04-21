//
//  CharactersListView.swift
//  Lazy Loader
//
//  Created by Ankit Kumar Ojha on 16/04/26.
//

import SwiftUI

struct CharactersListView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @StateObject var vm = CharactersViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    if vm.isLoading || vm.isRefreshing {
                        ForEach(1...10, id: \.self) { _ in
                            CharacterCardSkeleton()
                        }
                    } else {
                        ForEach(vm.characters) { character in
                            CharacterCard(character: character)
                                .padding(.bottom, 10)
                                .padding(.horizontal, 16)
                                .onAppear {
                                    if vm.shouldLoadMore(currentItem: character) {
                                        Task {
                                            await vm.loadMoreCharacters()
                                        }
                                    }
                                }
                        }
                    }
                }
                .id(vm.isRefreshing) 
                
                if vm.isLoadingMore {
                    CharacterCardSkeleton()
                    CharacterCardSkeleton()
                    CharacterCardSkeleton()
                    CharacterCardSkeleton()
                }
            }
            .navigationTitle(Text("Characters (\(vm.page)/\(vm.pages))"))
            .refreshable {
                await vm.loadCharacters(isRefresh: true)
            }
        }
        .task {
            await vm.loadCharacters()
        }
    }
}

#Preview {
    CharactersListView()
}
