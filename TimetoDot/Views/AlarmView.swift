import SwiftUI

struct AlarmView: View {
    @EnvironmentObject var clockData: ClockState
    @ObservedObject var colorManager = ColorManager()
    
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
                        
                        ZStack {
                            if isSign {
                                Circle()
                                    .foregroundColor(circleNumber == 0 || circleNumber == 2 ? Color("disabledBrailleColor") : Color("alarmColor"))
                            } else {
                                Circle()
                                    .foregroundColor(colorManager.changeAlarmColors(for: circleNumber, alarmHour: clockData.alarmHour))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AlarmView()
        .environmentObject(ClockState())
}
