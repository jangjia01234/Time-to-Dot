import SwiftUI

struct GuideView: View {
    let guideTextList : [String] = TextData.guideText
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // MARK: Title
                Text(guideTextList[0])
                    .font(.system(size: 44))
                    .fontWeight(.bold)
                    .padding(.bottom, 50)
                
                VStack(alignment: .leading) {
                    // MARK: Onboarding
                    VStack(alignment: .leading) {
                        Text(guideTextList[1])
                            .padding(.bottom, 2)
                            .fontWeight(.bold)
                        
                        Text(guideTextList[2])
                        Text(guideTextList[3])
                    }
                    .padding(.bottom, 20)
                    
                    // MARK: 1. Braille clock
                    VStack(alignment: .leading) {
                        Text(guideTextList[4])
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                        
                        Text(guideTextList[5])
                        Text(guideTextList[6])
                            .padding(.bottom, 20)
                    }
                    
                    // MARK: 2. Easy alarm
                    VStack(alignment: .leading) {
                        Text(guideTextList[7])
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                        
                        Text(guideTextList[8])
                            .padding(.bottom, 5)
                        
                        Text(guideTextList[9])
                        Text(guideTextList[10])
                        Text(guideTextList[11])
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .font(.system(size: 24))
        }
        .padding(.horizontal, 50)
        .foregroundColor(.black)
        .background(Color("guideBgColor"))
    }
}

#Preview {
    GuideView()
}

