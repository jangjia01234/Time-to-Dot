import SwiftUI
import AVKit

class SoundManager {
    enum Sound: String {
        case positive = "brailleClockAlarm"
    }
    
    static let shared = SoundManager()
    private var player: AVAudioPlayer?
    var isAlarmSoundOn = false
    
    private init() { }
    
    func playSound(sound: Sound) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else {
            fatalError("File not found")
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            isAlarmSoundOn = true
        } catch {
            print("error: ", error)
        }
    }
    
    func stopSound() {
        player?.stop()
        isAlarmSoundOn = false
    }
}


