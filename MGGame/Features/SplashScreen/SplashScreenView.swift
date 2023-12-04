import SwiftUI

struct SplashScreenView: View {
    @State var animationEnded: Bool = false
    @State var rectangleArray: [CGPoint] = []
    @State var animationTimer = 0.0

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func pickRandomColor() -> Color {
        let availableColors = ColorManager.Colors.allColors
        let randomIndex = Int.random(in: 0..<availableColors.count)
        
        return availableColors[randomIndex]
    }
    
    func generateAnimation(width: Double, height: Double) {
        let selectedRegion = Int.random(in: 0...3)
        
        switch selectedRegion {
        case 0:
            let topLeftCornerWidthPosition = CGFloat.random(in: 0..<width * 0.4)
            let topLeftCornerHeightPosition = CGFloat.random(in: 0...height * 0.4)
            let topLeftCGPoint = CGPoint(x: topLeftCornerWidthPosition, y: topLeftCornerHeightPosition)
            rectangleArray.append(topLeftCGPoint)
            
        case 1:
            let topRightCornerWidthPosition = CGFloat.random(in: width/2..<width)
            let topRightCornerHeightPosition = CGFloat.random(in: 0...height * 0.4)
            let topRightCGPoint = CGPoint(x: topRightCornerWidthPosition, y: topRightCornerHeightPosition)
            rectangleArray.append(topRightCGPoint)
            
        case 2:
            let botLeftCornerWidthPosition = CGFloat.random(in: 0..<250)
            let botLeftCornerHeightPosition = CGFloat.random(in: height * 0.6...height)
            let botLeftCGPoint = CGPoint(x: botLeftCornerWidthPosition, y: botLeftCornerHeightPosition)
            rectangleArray.append(botLeftCGPoint)
            
        case 3:
            let botRightCornerWidthPosition = CGFloat.random(in: width/2..<width)
            let botRightCornerHeightPosition = CGFloat.random(in: height * 0.6...height)
            let botRightCGPoint = CGPoint(x: botRightCornerWidthPosition, y: botRightCornerHeightPosition)
            rectangleArray.append(botRightCGPoint)
        default:
            break
        }
    }
    
    var body: some View {
        ZStack {
            ForEach(rectangleArray.indices, id: \.self) { index in
                Rectangle()
                    .frame(width: 25, height: 25)
                    .position(rectangleArray[index])
                    .foregroundColor(pickRandomColor())
            }
            
            VStack {
                Spacer()
                Text("Pixelar")
                    .font(.nippoRegular(size: 64))
                Spacer()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { timer in
                animationTimer += 0.5
                generateAnimation(width: Double(screenWidth), height: Double(screenHeight))

                if animationTimer >= 5.0 {
                    timer.invalidate()
                    animationEnded.toggle()
                }
            })
        }

        .frame(width: screenWidth, height: screenHeight)
        .background(ColorManager.Colors.white.value)
        .animation(.default, value: rectangleArray)
    }
}

#Preview {
    SplashScreenView()
}
