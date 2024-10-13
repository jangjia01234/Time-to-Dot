//
//  GuideView.swift
//  TimetoDot
//
//  Created by Jia Jang on 7/14/24.
//

import SwiftUI

struct GuideView: View {
    let guideTextList: [String] = TextData.guideText
    
    var body: some View {
        ScrollView {
            ZStack {
                Color("guideBgColor")
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    title
                    content
                }
            }
        }
        .foregroundColor(.black)
        .background(Color("guideBgColor"))
    }
    
    private var title: some View {
        guideText(text: guideTextList[0], font: .largeTitle, fontWeight: .bold)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            welcome
            brailleClock
            easyAlarm
        }
    }
    
    private var welcome: some View {
        VStack(alignment: .leading){
            ForEach(1...3, id: \.self) { index in
                guideText(text: guideTextList[index], font: .title2, fontWeight: index == 1 ? .bold : nil)
            }
        }
    }
    
    private var brailleClock: some View {
        VStack(alignment: .leading){
            ForEach(4...6, id: \.self) { index in
                guideText(text: guideTextList[index], font: .title2, fontWeight: index == 4 ? .semibold : nil)
            }
        }
    }
    
    private var easyAlarm: some View {
        VStack(alignment: .leading){
            ForEach(7...11, id: \.self) { index in
                guideText(text: guideTextList[index], font: .title2, fontWeight: index == 7 ? .semibold : nil)
            }
        }
    }
    
    private func guideText(text: String, font: Font, fontWeight: Font.Weight?) -> some View {
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
