import SwiftUI

struct MinuteView: View {
    @ObservedObject var colorManager = ColorManager()
    
    let timer = Timer.publish(every: 60, on: .main, in: .default).autoconnect()
    
    var rows = 3
    var columns = 2
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Grid {
                        ForEach(0..<rows, id: \.self) { row in
                            GridRow {
                                ForEach(0..<columns, id: \.self) { column in
                                    let number = row * self.columns + column
                                    
                                    Circle()
                                        .foregroundColor(number == 0 || number == 2 ? Color("disabledBrailleColor") : Color("AccentColor"))
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
                                            .foregroundColor(colorManager.changeMinColors(for: circleNumber))
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
                                            .foregroundColor(colorManager.changeMinColors(for: circleNumber))
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
        }
        .onReceive(timer) { _ in
            colorManager.nowMin = Calendar.current.component(.minute, from: Date())
        }
    }
}

#Preview {
    MinuteView()
}
