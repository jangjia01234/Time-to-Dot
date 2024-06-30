import SwiftUI

struct AddTimeButton: View {
    @EnvironmentObject var clockData: ClockState
    
    var body: some View {
        Button(action: {
            if clockData.alarmHour == 12 { clockData.alarmHour = 1 }
            else { clockData.alarmHour += 1 }
        }, label: {
            Circle()
                .fill(Color("AccentColor"))
        })
    }
}
