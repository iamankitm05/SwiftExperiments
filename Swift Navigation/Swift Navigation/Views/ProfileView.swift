//
//  Profile.swift
//  Swift Navigation
//
//  Created by Ankit Kumar Ojha on 15/04/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Profile")
                .roundedCard(.green)
            
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
    ProfileView()
        .environmentObject(Router())
}
