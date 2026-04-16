//
//  HomeView.swift
//  Swift Navigation
//
//  Created by Ankit Kumar Ojha on 15/04/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Home")
                .roundedCard(.pink)
            
            Button {
                router.push(.screenA)
            } label: {
                Text("Go To Screen A")
                    .roundedCard(.blue, height: 80)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Router())
}
