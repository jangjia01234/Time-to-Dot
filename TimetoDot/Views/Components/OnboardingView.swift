//
//  OnboardingView.swift
//  TimetoDot
//
//  Created by Jia Jang on 10/3/24.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isRotated: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "rectangle.portrait.rotate")
                .rotationEffect(.degrees(isRotated ? 90 : 0))
                .font(.system(size: 80))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, Color("AccentColor"))
                .padding()
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: true)) {
                        self.isRotated = true
                    }
                }
                .frame(height: 100)
            
            Text("Please rotate device to\nlandscape mode")
                .font(.title2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(1))
        .edgesIgnoringSafeArea(.all)
        .transition(.opacity)
    }
}

#Preview {
    OnboardingView(isRotated: .constant(false))
}
