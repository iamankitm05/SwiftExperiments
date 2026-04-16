//
//  FavouriteView.swift
//  Swift Navigation
//
//  Created by Ankit Kumar Ojha on 15/04/26.
//

import SwiftUI

struct FavouriteView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Favourite")
                .roundedCard(.purple)
            
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
    FavouriteView()
        .environmentObject(Router())
}
