import SwiftUI

struct GuideView: View {
    let guideTextList: [String] = TextData.guideText
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                // MARK: - Title
                GuideText(text: guideTextList[0],
                          font: calculateFont(for: 0, size: geometry.size.width),
                          fontWeight: .bold)
                
                VStack(alignment: .leading) {
                    // MARK: - Onboarding
                    ForEach(1...3, id: \.self) { index in
                        GuideText(text: guideTextList[index],
                                  font: calculateFont(for: index, size: geometry.size.width),
                                  fontWeight: index == 1 ? .bold : nil)
                    }
                    
                    // MARK: - 1. Braille clock
                    ForEach(4...6, id: \.self) { index in
                        GuideText(text: guideTextList[index],
                                  font: calculateFont(for: index, size: geometry.size.width),
                                  fontWeight: index == 4 ? .semibold : nil)
                    }
                    
                    // MARK: - 2. Easy alarm
                    ForEach(7...11, id: \.self) { index in
                        GuideText(text: guideTextList[index],
                                  font: calculateFont(for: index, size: geometry.size.width),
                                  fontWeight: index == 7 ? .semibold : nil)
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .foregroundColor(.black)
            .background(Color("guideBgColor"))
            .frame(width: geometry.size.width)
        }
    }
    
    func calculateFont(for index: Int, size: CGFloat) -> Font {
        if size > 800 {
            switch index {
            case 0:
                return .largeTitle
            case 1, 4, 7:
                return .title
            default:
                return .title2
            }
        } else {
            switch index {
            case 0:
                return .title2
            default:
                return .body
            }
        }
    }
}

struct GuideText: View {
    let text: String
    let font: Font
    var fontWeight: Font.Weight? = nil
    
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(fontWeight)
            .accessibilityLabel(text)
            .padding(.vertical, 2)
    }
}


#Preview {
    GuideView()
}
