// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one big chunk.
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

fileprivate let lBgColor                   = Color(.displayP3, red: 248/255, green: 250/255, blue: 251/255, opacity: 1.0)
fileprivate let dBgColor                   = Color(.displayP3, red: 29/255, green: 19/255, blue: 44/255, opacity: 1.0)
fileprivate let lShadowColor               = Color(.displayP3, red: 242/255, green: 242/255, blue: 1, opacity: 1.0)
fileprivate let dShadowColor               = Color(.displayP3, red: 45/255, green: 26/255, blue: 88/255, opacity: 1.0)
fileprivate let lBaseColor                 = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)
fileprivate let dBaseColor                 = Color(.displayP3, red: 30/255, green: 17/255, blue: 44/255, opacity: 1.0)
fileprivate let lTextColor                 = Color(.displayP3, red: 30/255, green: 21/255, blue: 49/255, opacity: 1.0)
fileprivate let dTextColor                 = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)
fileprivate let lfadedBackgroundColor      = Color(.displayP3, red: 240/255, green: 242/255, blue: 246/255, opacity: 1.0)
fileprivate let dfadedBackgroundColor      = Color(.displayP3, red: 16/255, green: 10/255, blue: 23/255, opacity: 1.0)

fileprivate let firstAccentColor           = Color(.displayP3, red: 99/255, green: 25/255, blue: 229/255, opacity: 1.0)
fileprivate let secondAccentColor          = Color(.displayP3, red: 1, green: 10/255, blue: 142/255, opacity: 1.0)
fileprivate let thirdAccentColor           = Color(.displayP3, red: 2/255, green: 160/255, blue: 250/255, opacity: 1.0)

struct LineGraph: View {
    
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let shadowColor = colorScheme == .dark ? dShadowColor : lShadowColor
        let baseColor = colorScheme == .dark ? dBaseColor : lBaseColor
        
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius)
                .foregroundColor(baseColor)
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
    
    @Environment(\.colorScheme) var colorScheme
    
    var itemAccentColor: Color
    var itemTitle:       String
    var padding:         CGFloat
    
    var body: some View {
        
        let textColor = colorScheme == .dark ? dTextColor : lTextColor
        let darkFaded = colorScheme == .dark ? dfadedBackgroundColor : lfadedBackgroundColor
        
        VStack {
            ZStack {
                GeometryReader { gr in
                    RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                        .fill(darkFaded)
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
                .background(lBgColor)
            LineGraph()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.dark)
                .background(dBgColor)
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
