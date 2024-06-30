import SwiftUI

struct ContentView: View {
    @EnvironmentObject var clockData: ClockState
    @GestureState private var isDetectingLongPress: ClockState.LongPressState = .inactive
    @State private var isOnboardingTextOn: Bool = true
    @State private var hideOnboarding: Bool = false
    @State private var isRotated = false
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HStack {
                        if !clockData.isAlarmOn {
                            GuideButton()
                        }
                        
                        Spacer()
                        
                        if clockData.isAlarmOn {
                            AddTimeButton()
                                .frame(width: geometry.size.width / 10)
                                .padding(.trailing, geometry.size.width > 800 ? 10 : 0)
                        }
                        
                        AlarmButton()
                            .frame(width: geometry.size.width > 800 ? geometry.size.width / 6 : geometry.size.width / 7.5)
                    }
                    .padding(.horizontal, 40)
                    .frame(width: geometry.size.width, height: geometry.size.height / 6)
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
                
                if isOnboardingTextOn && !hideOnboarding && verticalSizeClass == .regular {
                    VStack(spacing: 20) {
                        Image(systemName: "rectangle.portrait.rotate")
                            .rotationEffect(.degrees(isRotated ? 90 : 0))
                            .font(.system(size: 80))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, Color("AccentColor"))
                            .padding()
                            .onAppear {
                                withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: true)) {
                                    self.isRotated = true
                                }
                            }
                            .frame(height: 100)
                        
                        Text("Please rotate device to\nlandscape mode")
                            .font(.title2)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .padding(.horizontal, 40)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(1))
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onAppear {
                if !hideOnboarding {
                    isOnboardingTextOn = true
                }
            }
        }
        .background(clockData.isGuideOn ? Color("guideBgColor") : Color("clockBgColor"))
        .onTapGesture {
            if clockData.isAlarmOn { clockData.isAlarmOn = false }
            
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
