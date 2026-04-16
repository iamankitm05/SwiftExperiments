import SwiftUI

extension View {
    func roundedCard(
         _ color: Color = .blue,
         width: CGFloat = 260,
         height: CGFloat = 260
    ) -> some View {
        self
            .frame(
                width: width,
                height: height
            )
            .background(color)
            .font(.title2)
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}
