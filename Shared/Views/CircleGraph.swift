/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

import SwiftUI

/* Defining all constants used in the view.
 Idealy, you would calculate these based on your view size or layout. 👌*/
fileprivate let baseSize:        CGFloat = 300
fileprivate let lineWidth:       CGFloat = 40
fileprivate let shadowRadius:    CGFloat = 20
fileprivate let imageFontSize:   CGFloat = 50
fileprivate let textFontSize:    CGFloat = 80
fileprivate let completionStart: CGFloat = 0
fileprivate let completionEnd:   CGFloat = 0.7

fileprivate let lightShadowColor        = Color(.displayP3, red: 0.70, green: 0.70, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor         = Color(.displayP3, red: 0.3137, green: 0.1294, blue: 0.6980, opacity: 1.0)
fileprivate let baseAccentColor     = Color(.displayP3, red: 0.39, green: 0.1, blue: 0.9, opacity: 1.0)
fileprivate let shadowColor         = Color(.displayP3, red: 0.9, green: 0.9, blue: 1, opacity: 1.0)
//------------------- REFACTOR ABOVE THIS LINE ---------------------------------------

struct CircleGraph: View {
    
    /*
     Please please don't use the colors this way 😅 I am only adding it here so you can have a preview
     for both light and dark views. You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let shadowColor = colorScheme == .dark ? darkShadowColor : lightShadowColor
        
        ZStack {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: baseSize, height: baseSize)
                    .shadow(color: shadowColor, radius: shadowRadius)
                VStack {
                    Image(systemName: "chart.bar.fill")
                        .font(Font.system(size: imageFontSize, weight: .black, design: .rounded))
                    Text("70")
                        .font(Font.system(size: textFontSize, weight: .heavy, design: .rounded))
                }
                .foregroundColor(baseAccentColor)
            }
            Circle()
                .trim(from: completionStart, to: completionEnd)
                .stroke(baseAccentColor,
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: CGLineCap.round))
                .frame(width: baseSize + lineWidth, height: baseSize + lineWidth)
                .rotationEffect(.degrees(-90))
                .shadow(color: shadowColor, radius: shadowRadius)
        }
        
    }
}

/*
 Awesome Sauce!
 Thank you for getting one of my views, hope you are happy with it 👌
 Consider helping this train rollin 🚂 on my Patreon -> https://www.patreon.com/swiftui
 
 If you have any suggestions for improvements,
 feel free to reach me at undead.pix3l@gmail.com
 */
