import SwiftUI

// 🔥 FIX: 알람 소리 울리지만, 화면 터치해도 꺼지지 않는 버그 있음!!
// -> 아 설마 1시간 단위라서 안울리나?? ㅋㅋ허무..

struct ContentView: View {
    @EnvironmentObject var clockData: ClockState
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @GestureState private var isDetectingLongPress: ClockState.LongPressState = .inactive
    
    @State private var isRotated = false
    
    @ObservedObject var colorManager = ColorManager()
    
    let timer = Timer.publish(every: 60, on: .main, in: .default).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            displayMainView(geometry: geometry)
        }
        .background(changeBgColor())
        .onTapGesture {
            stopAlarmSound(clockData: clockData)
        }
    }
}



fileprivate extension ContentView {
    // MARK: - Components
    func topBar(geometry: GeometryProxy) -> some View {
        HStack {
            if clockData.isAlarmOn {
                Spacer()
                AddTimeButton()
            } else {
                GuideButton()
                Spacer()
            }
            
            AlarmButton()
                .frame(width: geometry.size.width > 800 ? 160 : 100)
        }
        .padding(.horizontal, 40)
        .padding(.top, 20)
        .frame(height: geometry.size.width > 800 ? geometry.size.height / 9 : geometry.size.height / 5)
    }
    
    func gridView(row: Int, isSign: Bool, type: TimeType, colorManager: ColorManager, offset: Int) -> some View {
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
    
    // MARK: - Views
//    func clockView(type: TimeType, colorManager: ColorManager) -> some View {
//        GeometryReader { geometry in
//            VStack {
//                HStack {
//                    Grid {
//                        ForEach(0..<3, id: \.self) { row in
//                            gridView(row: row, isSign: true, type: type, colorManager: colorManager, offset: 0)
//                        }
//                    }
//                    .padding(.horizontal, 20)
//                        
//                    Grid {
//                        ForEach(0..<3, id: \.self) { row in
//                            gridView(row: row, isSign: false, type: type, colorManager: colorManager, offset: 1)
//                        }
//                    }
//                    .padding(.horizontal, 20)
//                    
//                    Grid {
//                        ForEach(0..<3, id: \.self) { row in
//                            gridView(row: row, isSign: false, type: type, colorManager: colorManager, offset: 7)
//                        }
//                    }
//                    .padding(.horizontal, 20)
//                }
//            }
//            .padding(.horizontal, 60)
//            .frame(width: geometry.size.width, height: geometry.size.height)
//        }
//    }
    
    // MARK: - Functions
    func changeBgColor() -> Color {
        switch clockData.isGuideOn {
        case true:
            return Color("guideBgColor")
        default:
            return Color("clockBgColor")
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
                    ClockView(type: .hour, colorManager: colorManager)
                    ClockView(type: .minute, colorManager: colorManager)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            )
        }
    }
    
    func displayMainView(geometry: GeometryProxy) -> some View {
        ZStack {
            // MARK: - iPhone일 때만 가로 모드 권장
            if geometry.size.width < 800 && verticalSizeClass == .regular {
                OnboardingView(isRotated: $isRotated)
            } else {
                VStack {
                    topBar(geometry: geometry)
                    displayClockView()
                }
            }
        }
        .frame(width: geometry.size.width, height: geometry.size.height)
    }
}

#Preview {
    ContentView()
        .environmentObject(ClockState())
}
