import SwiftUI

struct GuideView: View {
    let guideTextList : [String] = TextData.guideText
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    // MARK: Title
                    Text(guideTextList[0])
                        .font(geometry.size.width > 800 ? .largeTitle : .title2)
                        .fontWeight(.bold)
                        .accessibilityLabel(guideTextList[0])
                    
                    VStack(alignment: .leading, spacing: 16) {
                        // MARK: Onboarding
                        VStack(alignment: .leading) {
                            Text(guideTextList[1])
                                .font(geometry.size.width > 800 ? .title : .body)
                                .fontWeight(.bold)
                                .accessibilityLabel(guideTextList[1])
                            
                            Text(guideTextList[2])
                                .font(geometry.size.width > 800 ? .title2 : .body)
                                .accessibilityLabel(guideTextList[2])
                            Text(guideTextList[3])
                                .font(geometry.size.width > 800 ? .title2 : .body)
                                .accessibilityLabel(guideTextList[3])
                        }
                        
                        // MARK: 1. Braille clock
                        VStack(alignment: .leading) {
                            Text(guideTextList[4])
                                .font(geometry.size.width > 800 ? .title : .body)
                                .fontWeight(.semibold)
                                .accessibilityLabel(guideTextList[4])
                            
                            Text(guideTextList[5])
                                .font(geometry.size.width > 800 ? .title2 : .body)
                                .accessibilityLabel(guideTextList[5])
                            Text(guideTextList[6])
                                .font(geometry.size.width > 800 ? .title2 : .body)
                                .accessibilityLabel(guideTextList[6])
                        }
                        
                        // MARK: 2. Easy alarm
                        VStack(alignment: .leading) {
                            Text(guideTextList[7])
                                .font(geometry.size.width > 800 ? .title : .body)
                                .fontWeight(.semibold)
                                .accessibilityLabel(guideTextList[7])
                            
                            Text(guideTextList[8])
                                .font(geometry.size.width > 800 ? .title2 : .body)
                                .accessibilityLabel(guideTextList[8])
                            
                            Text(guideTextList[9])
                                .font(geometry.size.width > 800 ? .title2 : .body)
                                .accessibilityLabel(guideTextList[9])
                            Text(guideTextList[10])
                                .font(geometry.size.width > 800 ? .title2 : .body)
                                .accessibilityLabel(guideTextList[10])
                            Text(guideTextList[11])
                                .font(geometry.size.width > 800 ? .title2 : .body)
                                .accessibilityLabel(guideTextList[11])
                        }
                    }
                    .padding(.horizontal, 20)
                    .accessibilityElement(children: .combine)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 40)
                .foregroundColor(.black)
                .background(Color("guideBgColor"))
            }
        }
    }
}

#Preview {
    GuideView()
}
