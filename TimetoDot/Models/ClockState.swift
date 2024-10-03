import SwiftUI

class ClockState: ObservableObject {
    @Published var isAlarmOn: Bool = false
    @Published var completedLongPress: Bool = false
    @Published var alarmHour: Int = 0
    @Published var isGuideOn: Bool = false
    @Published var isDetectingLongPress: LongPressState = .inactive
    
    enum LongPressState {
        case active
        case inactive
    }
    
    func toggleGuide() {
        isGuideOn.toggle()
    }
}

