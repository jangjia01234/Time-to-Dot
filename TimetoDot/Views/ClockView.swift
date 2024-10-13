//
//  ClockView.swift
//  TimetoDot
//
//  Created by Jia Jang on 10/3/24.
//

import SwiftUI

struct ClockView: View {
    var type: TimeType
    @ObservedObject var colorManager: ColorManager

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Grid {
                        ForEach(0..<3, id: \.self) { row in
                            gridRowView(row: row, isSign: true, type: type, colorManager: colorManager, offset: 0)
                        }
                    }
                    .padding(.horizontal, 20)

                    Grid {
                        ForEach(0..<3, id: \.self) { row in
                            gridRowView(row: row, isSign: false, type: type, colorManager: colorManager, offset: 1)
                        }
                    }
                    .padding(.horizontal, 20)

                    Grid {
                        ForEach(0..<3, id: \.self) { row in
                            gridRowView(row: row, isSign: false, type: type, colorManager: colorManager, offset: 7)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding(.horizontal, 60)
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

fileprivate extension ClockView {
    func gridRowView(row: Int, isSign: Bool, type: TimeType, colorManager: ColorManager, offset: Int) -> some View {
        GridRow {
            ForEach(0..<2, id: \.self) { column in
                let circleNumber = row * 2 + column + offset
                
                if isSign {
                    Circle()
                        .foregroundColor(circleNumber == 0 || circleNumber == 2 ? Color("disabledBrailleColor") : Color("AccentColor"))
                } else {
                    Circle()
                        .foregroundColor(type == .hour ?
                                         colorManager.changeHourColors(for: circleNumber) :
                                            colorManager.changeMinColors(for: circleNumber))
                }
                
            }
        }
    }
}


//#Preview {
//    ClockView(type: .constant(.hour), colorManager: ColorManager)
//}
