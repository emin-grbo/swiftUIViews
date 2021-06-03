// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate var defaultPadding:     CGFloat = 24
fileprivate var fontSize:           CGFloat = 8
fileprivate var lineWidth:          CGFloat = 24
fileprivate var defaultRadius:      CGFloat = 24
fileprivate var graphSmallPadding:  CGFloat = 35
fileprivate var graphBigPadding:    CGFloat = 60
fileprivate var frameSize:          CGFloat = 200

fileprivate var firstItem:          String = "FIRST"
fileprivate var secondItem:         String = "SECOND"
fileprivate var thirdItem:          String = "THIRD"
  
fileprivate let lightShadowColor        = Color(.displayP3, red: 0.95, green: 0.95, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor         = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)
fileprivate let textColor               = Color(.displayP3, red: 0.117, green: 0.125, blue: 0.192, opacity: 1.0)
fileprivate let firstAccentColor        = Color(.displayP3, red: 0.39, green: 0.1, blue: 0.9, opacity: 1.0)
fileprivate let secondAccentColor       = Color(.displayP3, red: 1, green: 0.04, blue: 0.56, opacity: 1.0)
fileprivate let thirdAccentColor        = Color(.displayP3, red: 0.011, green: 0.631, blue: 0.984, opacity: 1.0)
fileprivate let fadedBackgroundColor    = Color(.displayP3, red: 0.694, green: 0.737, blue: 0.815, opacity: 1.0)

struct LineGraph: View {
    
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        
        let shadowColor = colorScheme == .dark ? darkShadowColor : lightShadowColor
        
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius)
                .foregroundColor(Color.white)
                .shadow(color: shadowColor, radius: defaultRadius)
            HStack {
                SingleGraph(itemAccentColor: firstAccentColor, itemTitle: firstItem, padding: graphBigPadding)
                Spacer(minLength: 16)
                SingleGraph(itemAccentColor: secondAccentColor, itemTitle: secondItem, padding: graphSmallPadding)
                Spacer(minLength: 16)
                SingleGraph(itemAccentColor: thirdAccentColor, itemTitle: thirdItem, padding: graphBigPadding)
            }
            .padding(defaultPadding)
        }
        .frame(width: frameSize, height: frameSize)
        .padding(.horizontal, defaultPadding)
    }
}

struct SingleGraph: View {
    
    var itemAccentColor: Color
    var itemTitle:       String
    var padding:         CGFloat
    
    var body: some View {
        VStack {
            ZStack {
                GeometryReader { gr in
                    RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                        .fill(fadedBackgroundColor)
                        .opacity(0.2)
                    RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                        .fill(itemAccentColor)
                        .padding(.top, padding)
                }
            }
            .frame(width: lineWidth)
            
            Text(itemTitle)
                .allowsTightening(true)
                .font(Font.system(size: fontSize, weight: .semibold, design: .rounded))
                .frame(width: lineWidth*2)
                .foregroundColor(textColor)
        }
    }
}

struct SingleGraph_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineGraph()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
            LineGraph()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.dark)
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
