//
//  CharacterCard.swift
//  Lazy Loader
//
//  Created by Ankit Kumar Ojha on 16/04/26.
//

import SwiftUI

struct CharacterCard: View {
    let character: Character
    
    var body: some View {
        HStack(spacing: 12) {
            
            // MARK: - Image
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray.opacity(0.1)
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                    
                case .failure:
                    Image("placeholder")
                        .resizable()
                        .scaledToFill()
                    
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 90, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            
            // MARK: - Info
            VStack(alignment: .leading, spacing: 6) {
                
                Text(character.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(character.species)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(character.gender)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(12)
        
        // MARK: - Card Background
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
        )
        
        // MARK: - Border
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.05), lineWidth: 1)
        )
        
        // MARK: - Shadow
        .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    CharacterCard(character: Character.mock)
}
