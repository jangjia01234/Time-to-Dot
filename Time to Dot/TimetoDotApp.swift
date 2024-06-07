import SwiftUI

@main
struct TimetoDotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ClockState())
        }
    }
}
