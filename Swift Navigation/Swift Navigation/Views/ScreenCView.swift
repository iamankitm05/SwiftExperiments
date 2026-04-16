//
//  ScreenAView.swift
//  Swift Navigation
//
//  Created by Ankit Kumar Ojha on 15/04/26.
//

import SwiftUI

struct ScreenCView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Screen C")
                .roundedCard(.blue)
            
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
            
            Button {
                router.reset()
            } label: {
                Text("Clear All")
                    .roundedCard(.green, height: 80)
            }
        }
    }
}

#Preview {
    ScreenCView()
        .environmentObject(Router())
}
