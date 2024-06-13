import SwiftUI

class ColorManager: ObservableObject {
    @Published var nowHour = Calendar.current.component(.hour, from: Date())
    @Published var nowMin = Calendar.current.component(.minute, from: Date())
    
    func changeHourColors(for id: Int) -> Color {
        switch nowHour {
        case 0 where id == 2 || id == 3 || id == 4:
            return Color ("accentColor")
        case 1 where id == 1:
            return Color("accentColor")
        case 2 where id == 1 || id == 3:
            return Color("accentColor")
        case 3 where id == 1 || id == 2:
            return Color("accentColor")
        case 4 where id == 1 || id == 2 || id == 4:
            return Color("accentColor")
        case 5 where id == 1 || id == 4:
            return Color("accentColor")
        case 6 where id == 1 || id == 2 || id == 3:
            return Color("accentColor")
        case 7 where id == 1 || id == 2 || id == 3 || id == 4:
            return Color("accentColor")
        case 8 where id == 1 || id == 3 || id == 4:
            return Color("accentColor")
        case 9 where id == 2 || id == 3:
            return Color("accentColor")
        case 10 where id == 1 || id == 8 || id == 9 || id == 10:
            return Color("accentColor")
            
        case 11 where id == 1 || id == 7:
            return Color("accentColor")
        case 12 where id == 1 || id == 7 || id == 9:
            return Color("accentColor")
        case 13 where id == 1 || id == 7 || id == 8:
            return Color("accentColor")
        case 14 where id == 1 || id == 7 || id == 8 || id == 10:
            return Color("accentColor")
        case 15 where id == 1 || id == 7 || id == 10:
            return Color("accentColor")
        case 16 where id == 1 || id == 7 || id == 8 || id == 9:
            return Color("accentColor")
        case 17 where id == 1 || id == 7 || id == 8 || id == 9 || id == 10:
            return Color("accentColor")
        case 18 where id == 1 || id == 7 || id == 9 || id == 10:
            return Color("accentColor")
        case 19 where id == 1 || id == 8 || id == 9:
            return Color("accentColor")
        case 20 where id == 1 || id == 3 || id == 8 || id == 9 || id == 10:
            return Color("accentColor")
            
        case 21 where id == 1 || id == 3 || id == 7:
            return Color("accentColor")
        case 22 where id == 1 || id == 3 || id == 7 || id == 9:
            return Color("accentColor")
        case 23 where id == 1 || id == 3 || id == 7 || id == 8:
            return Color("accentColor")
        case 24 where id == 1 || id == 3 || id == 7 || id == 8 || id == 10:
            return Color("accentColor")
        default:
            return Color("disabledBrailleColor")
        }
    }
    
    func changeMinColors(for id: Int) -> Color {
        if nowMin < 10 {
            switch nowMin {
            case 0 where id == 2 || id == 3 || id == 4:
                return Color ("accentColor")
            case 1 where id == 1:
                return Color("accentColor")
            case 2 where id == 1 || id == 3:
                return Color("accentColor")
            case 3 where id == 1 || id == 2:
                return Color("accentColor")
            case 4 where id == 1 || id == 2 || id == 4:
                return Color("accentColor")
            case 5 where id == 1 || id == 4:
                return Color("accentColor")
            case 6 where id == 1 || id == 2 || id == 3:
                return Color("accentColor")
            case 7 where id == 1 || id == 2 || id == 3 || id == 4:
                return Color("accentColor")
            case 8 where id == 1 || id == 3 || id == 4:
                return Color("accentColor")
            case 9 where id == 2 || id == 3:
                return Color("accentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 10 && nowMin < 20 {
            switch nowMin {
            case 10 where id == 1 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 11 where id == 1 || id == 7:
                return Color("accentColor")
            case 12 where id == 1 || id == 7 || id == 9:
                return Color("accentColor")
            case 13 where id == 1 || id == 7 || id == 8:
                return Color("accentColor")
            case 14 where id == 1 || id == 7 || id == 8 || id == 10:
                return Color("accentColor")
            case 15 where id == 1 || id == 7 || id == 10:
                return Color("accentColor")
            case 16 where id == 1 || id == 7 || id == 8 || id == 9:
                return Color("accentColor")
            case 17 where id == 1 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 18 where id == 1 || id == 7 || id == 9 || id == 10:
                return Color("accentColor")
            case 19 where id == 1 || id == 8 || id == 9:
                return Color("accentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 20 && nowMin < 30 {
            switch nowMin {
            case 20 where id == 1 || id == 3 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 21 where id == 1 || id == 3 || id == 7:
                return Color("accentColor")
            case 22 where id == 1 || id == 3 || id == 7 || id == 9:
                return Color("accentColor")
            case 23 where id == 1 || id == 3 || id == 7 || id == 8:
                return Color("accentColor")
            case 24 where id == 1 || id == 3 || id == 7 || id == 8 || id == 10:
                return Color("accentColor")
            case 25 where id == 1 || id == 3 || id == 7 || id == 10:
                return Color("accentColor")
            case 26 where id == 1 || id == 3 || id == 7 || id == 8 || id == 9:
                return Color("accentColor")
            case 27 where id == 1 || id == 3 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 28 where id == 1 || id == 3 || id == 7 || id == 9 || id == 10:
                return Color("accentColor")
            case 29 where id == 1 || id == 3 || id == 8 || id == 9:
                return Color("accentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 30 && nowMin < 40 {
            switch nowMin {
            case 30 where id == 1 || id == 2 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 31 where id == 1 || id == 2 || id == 7:
                return Color("accentColor")
            case 32 where id == 1 || id == 2 || id == 7 || id == 9:
                return Color("accentColor")
            case 33 where id == 1 || id == 2 || id == 7 || id == 8:
                return Color("accentColor")
            case 34 where id == 1 || id == 2 || id == 7 || id == 8 || id == 10:
                return Color("accentColor")
            case 35 where id == 1 || id == 2 || id == 7 || id == 10:
                return Color("accentColor")
            case 36 where id == 1 || id == 2 || id == 7 || id == 8 || id == 9:
                return Color("accentColor")
            case 37 where id == 1 || id == 2 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 38 where id == 1 || id == 2 || id == 7 || id == 9 || id == 10:
                return Color("accentColor")
            case 39 where id == 1 || id == 2 || id == 8 || id == 9:
                return Color("accentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 40 && nowMin < 50 {
            switch nowMin {
            case 40 where id == 1 || id == 2 || id == 4 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 41 where id == 1 || id == 2 || id == 4 || id == 7:
                return Color("accentColor")
            case 42 where id == 1 || id == 2 || id == 4 || id == 7 || id == 9:
                return Color("accentColor")
            case 43 where id == 1 || id == 2 || id == 4 || id == 7 || id == 8:
                return Color("accentColor")
            case 44 where id == 1 || id == 2 || id == 4 || id == 7 || id == 8 || id == 10:
                return Color("accentColor")
            case 45 where id == 1 || id == 2 || id == 4 || id == 7 || id == 10:
                return Color("accentColor")
            case 46 where id == 1 || id == 2 || id == 4 || id == 7 || id == 8 || id == 9:
                return Color("accentColor")
            case 47 where id == 1 || id == 2 || id == 4 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 48 where id == 1 || id == 2 || id == 4 || id == 7 || id == 9 || id == 10:
                return Color("accentColor")
            case 49 where id == 1 || id == 2 || id == 4 || id == 8 || id == 9:
                return Color("accentColor")
            default:
                return Color("disabledBrailleColor")
            }
        } else if nowMin >= 50 && nowMin < 60 {
            switch nowMin {
            case 50 where id == 1 || id == 4 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 51 where id == 1 || id == 4 || id == 7:
                return Color("accentColor")
            case 52 where id == 1 || id == 4 || id == 7 || id == 9:
                return Color("accentColor")
            case 53 where id == 1 || id == 4 || id == 7 || id == 8:
                return Color("accentColor")
            case 54 where id == 1 || id == 4 || id == 7 || id == 8 || id == 10:
                return Color("accentColor")
            case 55 where id == 1 || id == 4 || id == 7 || id == 10:
                return Color("accentColor")
            case 56 where id == 1 || id == 4 || id == 7 || id == 8 || id == 9:
                return Color("accentColor")
            case 57 where id == 1 || id == 4 || id == 7 || id == 8 || id == 9 || id == 10:
                return Color("accentColor")
            case 58 where id == 1 || id == 4 || id == 7 || id == 9 || id == 10:
                return Color("accentColor")
            case 59 where id == 1 || id == 4 || id == 8 || id == 9:
                return Color("accentColor")
            default:
                return Color("disabledBrailleColor")
            }
        }
        else {
            return Color("disabledBrailleColor")
        }
    }
}

