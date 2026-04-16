//
//  ScreenAView.swift
//  Swift Navigation
//
//  Created by Ankit Kumar Ojha on 15/04/26.
//

import SwiftUI

struct ScreenBView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Text("Screen B")
                .roundedCard(.blue)
            
            Button {
                router.push(.screenC)
            } label: {
                Text("Go To Screen C")
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
    ScreenBView()
        .environmentObject(Router())
}
