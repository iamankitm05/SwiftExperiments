//
//  ContentView.swift
//  Swift Navigation
//
//  Created by Ankit Kumar Ojha on 15/04/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                FavouriteView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourite")
                    }
                GalleryView()
                    .tabItem {
                        Image(systemName: "photo.fill")
                        Text("Gallery")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }.navigationDestination(for: Route.self) { route in
                navigate(to: route)
            }
        }.environmentObject(router)
    }
    
    @ViewBuilder
    func navigate(to route: Route) -> some View {
        switch route {
        case .screenA:
            ScreenAView()
        case .screenB:
            ScreenBView()
        case .screenC:
            ScreenCView()
        }
    }
}

#Preview {
    ContentView()
}
