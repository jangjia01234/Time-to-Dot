import SwiftUI

class ColorManager: ObservableObject {
    @Published var nowHour = Calendar.current.component(.hour, from: Date())
    @Published var nowMin = Calendar.current.component(.minute, from: Date())
    
    func changeHourColors(for id: Int) -> Color {
        switch nowHour {
        case 0 where id == 2 || id == 3 || id == 4:
            return Color ("AccentColor")
        case 1 where id == 1:
            return Color("AccentColor")
        case 2 where id == 1 || id == 3:
            return Color("AccentColor")
        case 3 where id == 1 || id == 2:
            return Color("AccentColor")
        case 4 where id == 1 || id == 2 || id == 4:
            return Color("AccentColor")
        case 5 where id == 1 || id == 4:
            return Color("AccentColor")
        case 6 where id == 1 || id == 2 || id == 3:
            return Color("AccentColor")
        case 7 where id == 1 || id == 2 || id == 3 || id == 4:
            return Color("AccentColor")
        case 8 where id == 1 || id == 3 || id == 4:
            return Color("AccentColor")
        case 9 where id == 2 || id == 3:
            return Color("AccentColor")
        case 10 where id == 1 || id == 8 || id == 9 || id == 10:
            return Color("AccentColor")
            
        case 11 where id == 1 || id == 7:
            return Color("AccentColor")
        case 12 where id == 1 || id == 7 || id == 9:
            return Color("AccentColor")
        case 13 where id == 1 || id == 7 || id == 8:
            return Color("AccentColor")
        case 14 where id == 1 || id == 7 || id == 8 || id == 10:
            return Color("AccentColor")
        case 15 where id == 1 || id == 7 || id == 10:
            return Color("AccentColor")
        case 16 where id == 1 || id == 7 || id == 8 || id == 9:
            return Color("AccentColor")
        case 17 where id == 1 || id == 7 || id == 8 || id == 9 || id == 10:
            return Color("AccentColor")
        case 18 where id == 1 || id == 7 || id == 9 || id == 10:
            return Color("AccentColor")
        case 19 where id == 1 || id == 8 || id == 9:
            return Color("AccentColor")
        case 20 where id == 1 || id == 3 || id == 8 || id == 9 || id == 10:
            return Color("AccentColor")
            
        case 21 where id == 1 || id == 3 || id == 7:
            return Color("AccentColor")
        case 22 where id == 1 || id == 3 || id == 7 || id == 9:
            return Color("AccentColor")
        case 23 where id == 1 || id == 3 || id == 7 || id == 8:
            return Color("AccentColor")
        case 24 where id == 1 || id == 3 || id == 7 || id == 8 || id == 10:
            return Color("AccentColor")
        default:
            return Color("disabledBrailleColor")
        }
    }
    
    func changeMinColors(for id: Int) -> Color {
        if nowMin < 10 {
            switch nowMin {
            case 0 where id == 2 || id == 3 || id == 4:
                return Color ("AccentColor")
            case 1 where id == 1:
                return Color("AccentColor")
            case 2 where id == 1 || id == 3:
                return Color("AccentColor")
            case 3 where id == 1 || id == 2:
                return Color("AccentColor")
            case 4 where id == 1 || id == 2 || id == 4:
                return Color("AccentColor")
            case 5 where id == 1 || id == 4:
                return Color("AccentColor")
            case 6 where id == 1 || id == 2 || id == 3:
                return Color("AccentColor")
            case 7 where id == 1 || id == 2 || id == 3 || id == 4:
                return Color("AccentColor")
            case 8 where id == 1 || id == 3 || id == 4:
                return Color("AccentColor")
            case 9 where id == 2 || id == 3:
                return Color("AccentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 10 && nowMin < 20 {
            switch nowMin {
            case 10 where id == 1 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 11 where id == 1 || id == 7:
                return Color("AccentColor")
            case 12 where id == 1 || id == 7 || id == 9:
                return Color("AccentColor")
            case 13 where id == 1 || id == 7 || id == 8:
                return Color("AccentColor")
            case 14 where id == 1 || id == 7 || id == 8 || id == 10:
                return Color("AccentColor")
            case 15 where id == 1 || id == 7 || id == 10:
                return Color("AccentColor")
            case 16 where id == 1 || id == 7 || id == 8 || id == 9:
                return Color("AccentColor")
            case 17 where id == 1 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 18 where id == 1 || id == 7 || id == 9 || id == 10:
                return Color("AccentColor")
            case 19 where id == 1 || id == 8 || id == 9:
                return Color("AccentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 20 && nowMin < 30 {
            switch nowMin {
            case 20 where id == 1 || id == 3 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 21 where id == 1 || id == 3 || id == 7:
                return Color("AccentColor")
            case 22 where id == 1 || id == 3 || id == 7 || id == 9:
                return Color("AccentColor")
            case 23 where id == 1 || id == 3 || id == 7 || id == 8:
                return Color("AccentColor")
            case 24 where id == 1 || id == 3 || id == 7 || id == 8 || id == 10:
                return Color("AccentColor")
            case 25 where id == 1 || id == 3 || id == 7 || id == 10:
                return Color("AccentColor")
            case 26 where id == 1 || id == 3 || id == 7 || id == 8 || id == 9:
                return Color("AccentColor")
            case 27 where id == 1 || id == 3 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 28 where id == 1 || id == 3 || id == 7 || id == 9 || id == 10:
                return Color("AccentColor")
            case 29 where id == 1 || id == 3 || id == 8 || id == 9:
                return Color("AccentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 30 && nowMin < 40 {
            switch nowMin {
            case 30 where id == 1 || id == 2 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 31 where id == 1 || id == 2 || id == 7:
                return Color("AccentColor")
            case 32 where id == 1 || id == 2 || id == 7 || id == 9:
                return Color("AccentColor")
            case 33 where id == 1 || id == 2 || id == 7 || id == 8:
                return Color("AccentColor")
            case 34 where id == 1 || id == 2 || id == 7 || id == 8 || id == 10:
                return Color("AccentColor")
            case 35 where id == 1 || id == 2 || id == 7 || id == 10:
                return Color("AccentColor")
            case 36 where id == 1 || id == 2 || id == 7 || id == 8 || id == 9:
                return Color("AccentColor")
            case 37 where id == 1 || id == 2 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 38 where id == 1 || id == 2 || id == 7 || id == 9 || id == 10:
                return Color("AccentColor")
            case 39 where id == 1 || id == 2 || id == 8 || id == 9:
                return Color("AccentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 40 && nowMin < 50 {
            switch nowMin {
            case 40 where id == 1 || id == 2 || id == 4 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 41 where id == 1 || id == 2 || id == 4 || id == 7:
                return Color("AccentColor")
            case 42 where id == 1 || id == 2 || id == 4 || id == 7 || id == 9:
                return Color("AccentColor")
            case 43 where id == 1 || id == 2 || id == 4 || id == 7 || id == 8:
                return Color("AccentColor")
            case 44 where id == 1 || id == 2 || id == 4 || id == 7 || id == 8 || id == 10:
                return Color("AccentColor")
            case 45 where id == 1 || id == 2 || id == 4 || id == 7 || id == 10:
                return Color("AccentColor")
            case 46 where id == 1 || id == 2 || id == 4 || id == 7 || id == 8 || id == 9:
                return Color("AccentColor")
            case 47 where id == 1 || id == 2 || id == 4 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 48 where id == 1 || id == 2 || id == 4 || id == 7 || id == 9 || id == 10:
                return Color("AccentColor")
            case 49 where id == 1 || id == 2 || id == 4 || id == 8 || id == 9:
                return Color("AccentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 50 && nowMin < 60 {
            switch nowMin {
            case 50 where id == 1 || id == 4 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 51 where id == 1 || id == 4 || id == 7:
                return Color("AccentColor")
            case 52 where id == 1 || id == 4 || id == 7 || id == 9:
                return Color("AccentColor")
            case 53 where id == 1 || id == 4 || id == 7 || id == 8:
                return Color("AccentColor")
            case 54 where id == 1 || id == 4 || id == 7 || id == 8 || id == 10:
                return Color("AccentColor")
            case 55 where id == 1 || id == 4 || id == 7 || id == 10:
                return Color("AccentColor")
            case 56 where id == 1 || id == 4 || id == 7 || id == 8 || id == 9:
                return Color("AccentColor")
            case 57 where id == 1 || id == 4 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("AccentColor")
            case 58 where id == 1 || id == 4 || id == 7 || id == 9 || id == 10:
                return Color("AccentColor")
            case 59 where id == 1 || id == 4 || id == 8 || id == 9:
                return Color("AccentColor")
            default:
                return Color("disabledBrailleColor")
            }
        }
        else {
            return Color("disabledBrailleColor")
        }
    }
    
    func changeAlarmColors(for id: Int, alarmHour: Int) -> Color {
        switch alarmHour {
        case 0 where id == 2 || id == 3 || id == 4 || id == 8 || id == 9 || id == 10:
            return Color("alarmColor")
        case 1 where id == 1:
            return Color("alarmColor")
        case 2 where id == 1 || id == 3:
            return Color("alarmColor")
        case 3 where id == 1 || id == 2:
            return Color("alarmColor")
        case 4 where id == 1 || id == 2 || id == 4:
            return Color("alarmColor")
        case 5 where id == 1 || id == 4:
            return Color("alarmColor")
        case 6 where id == 1 || id == 2 || id == 3:
            return Color("alarmColor")
        case 7 where id == 1 || id == 2 || id == 3 || id == 4:
            return Color("alarmColor")
        case 8 where id == 1 || id == 3 || id == 4:
            return Color("alarmColor")
        case 9 where id == 2 || id == 3:
            return Color("alarmColor")
        case 10 where id == 1 || id == 8 || id == 9 || id == 10:
            return Color("alarmColor")
        case 11 where id == 1 || id == 7:
            return Color("alarmColor")
        case 12 where id == 1 || id == 7 || id == 9:
            return Color("alarmColor")
        default:
            return Color("disabledBrailleColor")
        }
    }
}

