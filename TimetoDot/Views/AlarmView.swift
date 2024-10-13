import SwiftUI

struct AlarmView: View {
    @EnvironmentObject var clockData: ClockState
    @ObservedObject var colorManager = ColorManager()
    
    private let haptic: HapticManager = HapticManager()
    
    var rows = 3
    var columns = 2
    
    var body: some View {
        alarmView
    }
    
    private var alarmView: some View {
        HStack {
            gridView(isSign: true, offset: 0)
                .padding(.leading, 40)
            gridView(isSign: false, offset: 1)
                .padding(.horizontal, 20)
            gridView(isSign: false, offset: 7)
                .padding(.trailing, 40)
        }
    }
    
    private func gridView(isSign: Bool, offset: Int) -> some View {
        Grid {
            ForEach(0..<rows, id: \.self) { row in
                GridRow {
                    ForEach(0..<columns, id: \.self) { column in
                        let circleNumber = row * self.columns + column + +offset
                        
                        if isSign {
                            circleButton(isSign: true, circleNumber: circleNumber, hapticStyle: circleNumber == 0 || circleNumber == 2 ? .heavy : .medium, color: circleNumber == 0 || circleNumber == 2 ? Color("disabledBrailleColor") : Color("alarmColor"))
                        } else {
                            circleButton(isSign: false, circleNumber: circleNumber, hapticStyle: colorManager.changeAlarmColors(for: circleNumber, alarmHour: clockData.alarmHour) == Color("alarmColor") ? .heavy : .medium, color: colorManager.changeAlarmColors(for: circleNumber, alarmHour: clockData.alarmHour))
                        }
                    }
                }
            }
        }
    }
    
    private func circleButton(isSign: Bool, circleNumber: Int, hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle, color: Color) -> some View {
        Button {
            haptic.impact(style: hapticStyle)
        } label: {
            Circle()
                .fill(color)
        }
    }
}

#Preview {
    AlarmView()
        .environmentObject(ClockState())
}
