import SwiftUI

struct GuideButton: View {
    @EnvironmentObject var clockData: ClockState
    
    var body: some View {
            Button(action: {
                clockData.toggleGuide()
            }, label: {
                Circle()
                    .foregroundColor(Color("guideButtonColor"))
                    .overlay(
                        Image(systemName: "questionmark")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    )
            })
        }
}
