//
//  AddTimeButton.swift
//  TimetoDot
//
//  Created by Jia Jang on 10/3/24.
//

import SwiftUI

struct AddTimeButton: View {
    @EnvironmentObject var clockData: ClockState

    var body: some View {
        Button {
            if clockData.alarmHour == 12 { clockData.alarmHour = 1 }
            else { clockData.alarmHour += 1 }
        } label: {
            Circle()
                .fill(Color("AccentColor"))
        }
    }
}

#Preview {
    AddTimeButton()
}
