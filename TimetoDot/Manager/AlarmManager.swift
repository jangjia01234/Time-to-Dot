//
//  AlarmManager.swift
//  TimetoDot
//
//  Created by Jia Jang on 10/3/24.
//

import SwiftUI

func stopAlarmSound(clockData: ClockState, soundManager: SoundManager = .shared) {
    if clockData.isAlarmOn {
        clockData.isAlarmOn = false
    }
    
    if soundManager.isAlarmSoundOn {
        soundManager.stopSound()
        clockData.isAlarmOn = false
        clockData.alarmHour = 0
    }
}
