import SwiftUI

struct AlarmView: View {
    @EnvironmentObject var clockData: ClockState
    @ObservedObject var colorManager = ColorManager()
    
    var rows = 3
    var columns = 2
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    // MARK: number formatting mark
                    Grid {
                        ForEach(0..<rows, id: \.self) { row in
                            GridRow {
                                ForEach(0..<columns, id: \.self) { column in
                                    let number = row * self.columns + column
                                    
                                    Circle()
                                        .foregroundColor(number == 0 || number == 2 ? Color("disabledBrailleColor") : Color("alarmColor"))
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    
                    Grid {
                        ForEach(0..<rows, id: \.self) { row in
                            GridRow {
                                ForEach(0..<columns, id: \.self) { column in
                                    let circleNumber = row * self.columns + column + 1
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(changeAlarmColors(for: circleNumber))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Grid {
                        ForEach(0..<rows, id: \.self) { row in
                            GridRow {
                                ForEach(0..<columns, id: \.self) { column in
                                    let circleNumber = row * self.columns + column + +7
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(changeAlarmColors(for: circleNumber))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    
                }
            }
            .padding(.horizontal, 60)
            .frame(width: geometry.size.width, height: geometry.size.height)
//            VStack {
//                Grid {
//                    GridRow {
//                        Color.clear
//                            .gridCellUnsizedAxes([.horizontal, .vertical])
//                    }
//                    ForEach(1..<4) { row in
//                        HStack {
//                            GridRow {
//                                ForEach(1..<3) { column in
//                                    let idNum = row * 2 + column - 2
//                                    Circle()
//                                        .foregroundColor(idNum == 2 || idNum == 4 || idNum == 5 || idNum == 6 ? Color("alarmColor") : Color("disabledBrailleColor"))
//                                        .id(idNum)
//                                }
//                                
//                                ForEach(1..<3) { column in
//                                    let idLeft = row * 2 + column - 2
//                                    Circle()
//                                        .foregroundColor(changeAlarmColors(for: idLeft))
//                                        .id(idLeft)
//                                        .padding(.leading, idLeft == 1 || idLeft == 3 || idLeft == 5 ? 36 : 0)
//                                        .padding(.trailing, idLeft == 2 || idLeft == 4 || idLeft == 6 ? 36 : 0)
//                                }
//                                
//                                ForEach(1..<3) { column in
//                                    let idRight = row * 2 + column + 4
//                                    Circle()
//                                        .foregroundColor(changeAlarmColors(for: idRight))
//                                        .id(idRight)
//                                }
//                            }
//                            .padding(.leading, -10)
//                        }
//                    }
//                    .padding(-5)
//                }
//                .padding(.top, 100)
//                .padding()
//            }
//            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    func changeAlarmColors(for id: Int) -> Color {
        switch clockData.alarmHour {
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

#Preview {
    AlarmView()
        .environmentObject(ClockState()) 
}
