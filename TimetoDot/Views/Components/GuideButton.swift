//
//  GuideButton.swift
//  TimetoDot
//
//  Created by Jia Jang on 10/3/24.
//

import SwiftUI

struct GuideButton: View {
    @EnvironmentObject var clockData: ClockState
    
    var body: some View {
        Button {
            clockData.toggleGuide()
        } label: {
            Circle()
                .foregroundColor(Color("guideButtonColor"))
                .overlay(
                    Image(systemName: "questionmark")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                )
        }
    }
}

#Preview {
    GuideButton()
}
