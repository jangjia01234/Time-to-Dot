import SwiftUI

struct ContentView: View {
    @EnvironmentObject var clockData: ClockState
    @GestureState var isDetectingLongPress : ClockState.LongPressState = .inactive
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 2)
            .updating($isDetectingLongPress) { currentState, gestureState,
                transaction in
                gestureState = .active
                transaction.animation = Animation.easeInOut(duration: 1.5)
            }
            .onEnded { finished in
                clockData.completedLongPress = finished
                clockData.isAlarmOn.toggle()
                
                if clockData.alarmHour > 0 {
                    Timer.scheduledTimer(withTimeInterval: Double(clockData.alarmHour * 60 * 60), repeats: false) { timer in
                        SoundManager.shared.playSound(sound: .positive)
                    }
                } else { print("long pressed") }
            }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    if !clockData.isAlarmOn {
                        GuideButton()
                    }
                    
                    Spacer()
                    
                    if clockData.isAlarmOn {
                        AddTimeButton()
                            .frame(width: geometry.size.width/10)
                            .padding(.trailing, geometry.size.width > 800 ? 10 : 0)
                    }
                    
                    AlarmButton()
                        .frame(width: geometry.size.width > 800 ? geometry.size.width/6 : geometry.size.width/7.5)
                }
                .padding(.horizontal, 40)
                .frame(width: geometry.size.width, height: geometry.size.height/6)
                .padding(.top, 20)
                
                if clockData.isGuideOn {
                    GuideView()
                } else if clockData.isAlarmOn {
                    AlarmView()
                        .environmentObject(clockData)
                } else {
                    TabView {
                        HourView()
                        MinuteView()
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .background(clockData.isGuideOn ? Color("guideBgColor") : Color("clockBgColor"))
        .onTapGesture {
            // MARK: Close Alarm Setting View when user touches anywhere
            if clockData.isAlarmOn { clockData.isAlarmOn = false }
            
            // MARK: Stop Alarm Sound when user touches anywhere (while the sound is ringing)
            if SoundManager.shared.isAlarmSoundOn {
                SoundManager.shared.stopSound()
                clockData.isAlarmOn = false
                clockData.alarmHour = 0
            }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(ClockState())
}
