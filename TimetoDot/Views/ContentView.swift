import SwiftUI

struct ContentView: View {
    @EnvironmentObject var clockData: ClockState
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @GestureState private var isDetectingLongPress: ClockState.LongPressState = .inactive
    
    @State private var isOnboardingTextOn: Bool = true
    @State private var hideOnboarding: Bool = false
    @State private var isRotated = false
    
    var body: some View {
        GeometryReader { geometry in
            displayMainView(geometry: geometry)
        }
        .background(changeBgColor())
        .onTapGesture {
            stopAlarmSound()
        }
    }
}

fileprivate extension ContentView {
    
    // MARK: - Components
    var addTimeButton: some View {
        Button(action: {
            if clockData.alarmHour == 12 { clockData.alarmHour = 1 }
            else { clockData.alarmHour += 1 }
        }, label: {
            Circle()
                .fill(Color("AccentColor"))
        })
    }
    
    var guideButton: some View {
        Button(action: {
            clockData.toggleGuide()
        }, label: {
            Circle()
                .foregroundColor(Color("guideButtonColor"))
                .overlay(
                    Image(systemName: "questionmark")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                )
        })
    }
    
    func topBar(geometry: GeometryProxy) -> some View {
        HStack {
            if clockData.isAlarmOn {
                HStack {
                    Spacer()
                    addTimeButton
                        .frame(width: geometry.size.width / 10)
                        .padding(.trailing, geometry.size.width > 800 ? 10 : 0)
                }
            } else {
                HStack {
                    guideButton
                    Spacer()
                }
            }
            
            AlarmButton()
                .frame(width: geometry.size.width > 800 ? geometry.size.width / 6 : geometry.size.width / 7.5)
        }
        .padding(.horizontal, 40)
        .frame(width: geometry.size.width, height: geometry.size.height / 6)
        .padding(.top, 20)
    }
    
    // MARK: - Functions
    func changeBgColor() -> Color {
        switch clockData.isGuideOn {
        case true:
            return Color("guideBgColor")
        default:
            return Color("clockBgColor")
        }
    }
    
    func showOnboarding(showOnboarding: Bool) {
        isOnboardingTextOn = showOnboarding
    }
    
    func stopAlarmSound() {
        if clockData.isAlarmOn {
            clockData.isAlarmOn = false
        }
        
        if SoundManager.shared.isAlarmSoundOn {
            SoundManager.shared.stopSound()
            clockData.isAlarmOn = false
            clockData.alarmHour = 0
        }
    }
    
    func displayClockView() -> some View {
        switch (clockData.isGuideOn, clockData.isAlarmOn) {
        case (true, _):
            return AnyView(GuideView())
        case (false, true):
            return AnyView(AlarmView().environmentObject(clockData))
        default:
            return AnyView(
                TabView {
                    HourView()
                    MinuteView()
                }
                    .tabViewStyle(.page(indexDisplayMode: .never))
            )
        }
    }
    
    func displayMainView(geometry: GeometryProxy) -> some View {
        ZStack {
            if isOnboardingTextOn && !hideOnboarding && verticalSizeClass == .regular {
                OnboardingView(isRotated: $isRotated)
            } else {
                VStack {
                    topBar(geometry: geometry)
                    displayClockView()
                }
            }
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
        .onAppear {
            showOnboarding(showOnboarding: !hideOnboarding)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ClockState())
}
