import SwiftUI

@main
struct TimetoDotApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ClockState())
        }
    }
}
