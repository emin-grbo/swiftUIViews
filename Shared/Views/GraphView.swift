// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one big chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let lightBgColor            = Color(.displayP3, red: 248/255, green: 250/255, blue: 251/255, opacity: 1.0)
fileprivate let darkBgColor             = Color(.displayP3, red: 29/255, green: 19/255, blue: 44/255, opacity: 1.0)
fileprivate let lightBaseColor          = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)
fileprivate let darkBaseColor           = Color(.displayP3, red: 30/255, green: 17/255, blue: 44/255, opacity: 1.0)
fileprivate let lShadowColor               = Color(.displayP3, red: 242/255, green: 242/255, blue: 1, opacity: 1.0)
fileprivate let dShadowColor               = Color(.displayP3, red: 45/255, green: 26/255, blue: 88/255, opacity: 1.0)

fileprivate let darkFirstColor          = Color(.displayP3, red: 1, green: 10/255, blue: 142/255, opacity: 1.0)
fileprivate let darkSecondColor         = Color(.displayP3, red: 0.39, green: 0.1, blue: 0.9, opacity: 1.0)
fileprivate let lightFirstColor         = Color(.displayP3, red: 225/255, green: 225/255, blue: 255/255, opacity: 1.0)
fileprivate let lightSecondColor        = Color(.displayP3, red: 235/255, green: 235/255, blue: 255/255, opacity: 1.0)

fileprivate let lightGradient = LinearGradient(gradient: Gradient(colors: [lightFirstColor, lightSecondColor]),
                                               startPoint: .leading, endPoint: .trailing)
fileprivate let darkGradient = LinearGradient(gradient: Gradient(colors: [darkFirstColor, darkSecondColor]),
                                              startPoint: .leading, endPoint: .trailing)
fileprivate let points: Array<Double> = [
    140,
    90,
    150,
    50,
    150,
    90
]

struct GraphView: View {
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let baseColor   = colorScheme == .dark ? darkBaseColor : lightBaseColor
        let lineColor = colorScheme == .dark ? .white : darkSecondColor
        let gradinet = colorScheme == .dark ? darkGradient : lightGradient
        let shadowColor = colorScheme == .dark ? dShadowColor : lShadowColor
        
        ZStack {
            Rectangle()
                .fill(baseColor)
                .cornerRadius(32)
            GraphBase()
                .fill(gradinet)
                .mask(Rectangle().cornerRadius(32))
                .opacity(0.8)
            GraphLine()
                .stroke(lineColor, style: StrokeStyle(lineWidth: 8, lineCap: CGLineCap.round))
        }
        .frame(height: 200)
        .shadow(color: shadowColor, radius: 24)
    }
}

struct GraphLine: Shape {
    func path(in rect: CGRect) -> Path {
        let stepWidth = rect.width / CGFloat(points.count - 1)
        return Path.quadCurvedPathWithPoints(points: points,
                                             step: CGPoint(x: stepWidth,
                                                           y: 1))
    }
}


struct GraphBase: Shape {
    func path(in rect: CGRect) -> Path {
        let stepWidth = rect.width / CGFloat(points.count - 1)
        var path = Path.quadCurvedPathWithPoints(points: points,
                                                 step: CGPoint(x: stepWidth,
                                                               y: 1))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: 160))
        
        return path
    }
}

extension Path {
    
    static func quadCurvedPathWithPoints(points: Array<Double>, step: CGPoint) -> Path {
        
        var path = Path()
        
        if points.count < 2 {
            return path
        }
        
        var p1 = CGPoint(x: 0, y: CGFloat(points[0]) * step.y)
        path.move(to: p1)
        
        for pointIndex in 1..<points.count {
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex),
                             y: step.y * CGFloat(points[pointIndex]))
            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
            path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
            path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
            p1 = p2
        }
        
        return path
    }
}

extension CGPoint {
    
    static func midPointForPoints(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPoint(x: (p1.x + p2.x) / 2,y: (p1.y + p2.y) / 2)
    }
    
    static func controlPointForPoints(p1: CGPoint, p2: CGPoint) -> CGPoint {
        
        var controlPoint = CGPoint.midPointForPoints(p1:p1, p2:p2)
        let diffY = abs(p2.y - controlPoint.y)
        
        if p1.y < p2.y {
            controlPoint.y += diffY
        } else if p1.y > p2.y {
            controlPoint.y -= diffY
        }
        
        return controlPoint
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GraphView()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
                .background(lightBgColor)
            GraphView()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.dark)
                .background(darkBgColor)
        }
    }
}

/*
 Awesome Sauce!
 Thank you for getting one of my views, hope you are happy with it 👌
 Consider helping this train rollin 🚂 on my Patreon -> https://www.patreon.com/swiftui
 Or cup a coffee ☕️ -> https://ko-fi.com/swiftui
 
 If you have any suggestions for improvements,
 feel free to reach me at undead.pix3l@gmail.com
 */
