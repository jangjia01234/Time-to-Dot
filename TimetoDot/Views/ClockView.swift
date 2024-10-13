//
//  ClockView.swift
//  TimetoDot
//
//  Created by Jia Jang on 10/3/24.
//

import SwiftUI

struct ClockView: View {
    @ObservedObject var colorManager: ColorManager
    private let haptic: HapticManager = HapticManager()
    
    var body: some View {
        clockView
    }
    
    private var clockView: some View {
        HStack {
            hourGridView
            minuteGridView
        }
    }
    
    private var hourGridView: some View {
        HStack {
            gridView(offset: 1, type: .hour)
            gridView(offset: 7, type: .hour)
        }
    }
    
    private var minuteGridView: some View {
        HStack {
            gridView(offset: 1, type: .minute)
            gridView(offset: 7, type: .minute)
        }
    }
    
    private func gridView(offset: Int, type: TimeType) -> some View {
        Grid {
            ForEach(0..<3, id: \.self) { row in
                gridRowView(row: row, type: type, colorManager: colorManager, offset: offset)
            }
        }
        .padding(.horizontal, 10)
    }
    
    private func gridRowView(row: Int, type: TimeType, colorManager: ColorManager, offset: Int) -> some View {
        GridRow {
            ForEach(0..<2, id: \.self) { column in
                let circleNumber = row * 2 + column + offset
                
                Button {
                    if type == .hour {
                        haptic.impact(style: colorManager.changeHourColors(for: circleNumber) == Color("AccentColor") ? .heavy : .medium)
                    } else {
                        haptic.impact(style: colorManager.changeMinColors(for: circleNumber) == Color("AccentColor") ? .heavy : .medium)
                    }
                } label: {
                    Circle()
                        .foregroundColor(type == .hour ? colorManager.changeHourColors(for: circleNumber) : colorManager.changeMinColors(for: circleNumber))
                }
            }
        }
    }
}

#Preview {
    ClockView(colorManager: ColorManager())
}
