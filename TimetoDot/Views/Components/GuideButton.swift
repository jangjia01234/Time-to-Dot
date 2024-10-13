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
            Image(systemName: "questionmark")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(20)
                .background {
                    Circle()
                        .fill(Color("guideButtonColor"))
                }
        }
    }
}

#Preview {
    GuideButton()
}
