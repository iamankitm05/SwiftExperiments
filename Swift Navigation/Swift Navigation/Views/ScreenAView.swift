//
//  ScreenAView.swift
//  Swift Navigation
//
//  Created by Ankit Kumar Ojha on 15/04/26.
//

import SwiftUI

struct ScreenAView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Screen A")
                .roundedCard(.blue)
            
            Button {
                router.push(.screenB)
            } label: {
                Text("Go To Screen B")
                    .roundedCard(.green, height: 80)
            }
            
            Button {
                router.pop()
            } label: {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Go Back")
                        .padding()
                }
                    .roundedCard(.red, height: 80)
            }
        }
    }
}

#Preview {
    ScreenAView()
        .environmentObject(Router())
}
