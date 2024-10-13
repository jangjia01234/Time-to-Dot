import SwiftUI

struct HomeView: View {
    @ObservedObject var colorManager = ColorManager()
    @GestureState private var isDetectingLongPress: ClockState.LongPressState = .inactive
    @EnvironmentObject var clockData: ClockState
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @State private var isRotated = false
    
    private let timer = Timer.publish(every: 60, on: .main, in: .default).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            displayMainView(geometry: geometry)
        }
        .background(changeBgColor())
        .onTapGesture { stopAlarmSound(clockData: clockData) }
    }
    
    // MARK: - Subviews
    private func displayMainView(geometry: GeometryProxy) -> some View {
        ZStack {
            // MARK: iPhone일 때만 가로 모드 권장
            if geometry.size.width < 800 && verticalSizeClass == .regular {
                OnboardingView(isRotated: $isRotated)
            } else {
                VStack {
                    topBar(geometry: geometry)
                    displayMainView()
                }
            }
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
    }
    
    private func topBar(geometry: GeometryProxy) -> some View {
        let isIpad = geometry.size.width > 800
        
        return HStack {
            if !clockData.isAlarmOn {
                guideButton(font: isIpad ? .largeTitle: .title2, padding: isIpad ? 20 : 15)
            }
            
            Spacer()
            
            HStack {
                if clockData.isAlarmOn { addTimeButton }
                alarmButton(width: isIpad ? 160 : 100)
            }
        }
        .padding(.horizontal, 30)
        .frame(height: isIpad ? geometry.size.height / 9 : geometry.size.height / 7)
    }
    
    private func displayMainView() -> some View {
        VStack {
            switch (clockData.isGuideOn, clockData.isAlarmOn) {
            case (true, _):
                return AnyView(GuideView())
            case (false, true):
                return AnyView(AlarmView().environmentObject(clockData))
            default:
                return AnyView(ClockView(colorManager: colorManager))
            }
        }
        .padding(.top, 40)
        .padding(.horizontal, 20)
    }
    
    private func guideButton(font: Font, padding: CGFloat) -> some View {
        Button {
            clockData.toggleGuide()
        } label: {
            Image(systemName: "questionmark")
                .font(font)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(padding)
                .background {
                    Circle()
                        .fill(Color("guideButtonColor"))
                }
        }
    }
    
    private var addTimeButton: some View {
        Button {
            if clockData.alarmHour == 12 { clockData.alarmHour = 1 }
            else { clockData.alarmHour += 1 }
        } label: {
            Circle()
                .fill(Color("AccentColor"))
        }
    }
    
    private func alarmButton(width: CGFloat) -> some View {
        RoundedRectangle(cornerSize: CGSize(width: 100, height: 100))
            .fill(clockData.isDetectingLongPress == .active ?
                  (clockData.isAlarmOn ? Color("alarmColor") : Color("AccentColor")) :
                    (clockData.completedLongPress ? (clockData.isAlarmOn ? Color("AccentColor") : Color("alarmColor")) : Color("alarmColor")))
            .gesture(longPress)
            .animation(.easeInOut, value: isDetectingLongPress)
            .frame(width: width)
    }
    
    // MARK: - Functions
    private func changeBgColor() -> Color {
        return clockData.isGuideOn ? Color("guideBgColor") : Color("clockBgColor")
    }
    
    private var longPress: some Gesture {
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
}

#Preview {
    HomeView()
        .environmentObject(ClockState())
}
