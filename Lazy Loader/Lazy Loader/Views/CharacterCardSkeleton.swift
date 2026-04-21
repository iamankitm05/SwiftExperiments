//
//  CharacterCardSkeleton.swift
//  Lazy Loader
//
//  Created by Ankit Kumar Ojha on 20/04/26.
//

import SwiftUI

struct CharacterCardSkeleton: View {
    var body: some View {
        HStack(spacing: 12) {
            // Image placeholder
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 8) {
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 16)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 120, height: 14)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 14)
            }
        }
        .padding()
    }
}

#Preview {
    CharacterCardSkeleton()
}
