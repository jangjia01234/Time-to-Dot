import SwiftUI

struct AlarmButton: View {
    @EnvironmentObject var clockData: ClockState
    @GestureState var isDetectingLongPress : ClockState.LongPressState = .inactive
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 2)
            .updating($isDetectingLongPress) { currentState, gestureState,
                transaction in
                
                // 🚨 FIX: long press color animation
                transaction.animation = Animation.easeInOut(duration: 1.5)
                gestureState = .inactive
                
            }
            .onEnded { finished in
                clockData.completedLongPress = finished
                clockData.isAlarmOn.toggle()
                
                // MARK: - Alarm test (Now available every hour)
                if clockData.alarmHour > 0 {
                    Timer.scheduledTimer(withTimeInterval: Double(clockData.alarmHour * 60 * 60), repeats: false) { timer in
                        SoundManager.shared.playSound(sound: .positive)
                    }
                }
                else { print("long pressed") }
            }
    }
    
    var body: some View {
            RoundedRectangle(cornerSize: CGSize(width: 100, height: 100))
                .fill(clockData.isDetectingLongPress == .active ?
                      (clockData.isAlarmOn ? Color("alarmColor") : Color("AccentColor")) :
                        (clockData.completedLongPress ? (clockData.isAlarmOn ? Color("AccentColor") : Color("alarmColor")) : Color("alarmColor")))
                .gesture(longPress)
                .animation(.easeInOut, value: isDetectingLongPress)
    }
}
