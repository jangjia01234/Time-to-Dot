//
//  ClockView.swift
//  TimetoDot
//
//  Created by Jia Jang on 10/3/24.
//

import SwiftUI

struct ClockView: View {
    @ObservedObject var colorManager: ColorManager
    
    var type: TimeType
    var haptic: HapticManager = HapticManager()
    
    var body: some View {
        clockView
    }
    
    private var clockView: some View {
        HStack {
            gridView(isSign: true, offset: 0)
            gridView(isSign: false, offset: 1)
            gridView(isSign: false, offset: 7)
        }
        .padding(.horizontal, 60)
    }
    
    private func gridView(isSign: Bool, offset: Int) -> some View {
        Grid {
            ForEach(0..<3, id: \.self) { row in
                gridRowView(row: row, isSign: isSign, type: type, colorManager: colorManager, offset: offset)
            }
        }
        .padding(.horizontal, 20)
    }
    
    private func gridRowView(row: Int, isSign: Bool, type: TimeType, colorManager: ColorManager, offset: Int) -> some View {
        GridRow {
            ForEach(0..<2, id: \.self) { column in
                let circleNumber = row * 2 + column + offset
                
                if isSign {
                    Button {
                        haptic.impact(style: circleNumber == 0 || circleNumber == 2 ? .light : .heavy)
                    } label: {
                        Circle()
                            .foregroundColor(circleNumber == 0 || circleNumber == 2 ? Color("disabledBrailleColor") : Color("AccentColor"))
                    }
                } else {
                    Button {
                        if type == .hour {
                            haptic.impact(style: colorManager.changeHourColors(for: circleNumber) == Color("AccentColor") ? .heavy : .light)
                        } else {
                            haptic.impact(style: colorManager.changeMinColors(for: circleNumber) == Color("AccentColor") ? .heavy : .light)
                        }
                    } label: {
                        Circle()
                            .foregroundColor(type == .hour ?
                                             colorManager.changeHourColors(for: circleNumber) :
                                                colorManager.changeMinColors(for: circleNumber))
                    }
                }
            }
        }
    }
}

//#Preview {
//    ClockView(type: .constant(.hour), colorManager: ColorManager)
//}
