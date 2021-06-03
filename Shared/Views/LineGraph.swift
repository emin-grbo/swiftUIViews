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
  
fileprivate let lightBgColor = Color(.displayP3, red: 0.9764, green: 0.9803, blue: 0.9882, opacity: 1.0)
fileprivate let darkBgColor = Color(.displayP3, red: 0.1176, green: 0.0784, blue: 0.1725, opacity: 1.0)

fileprivate let lightShadowColor        = Color(.displayP3, red: 242/255, green: 242/255, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor         = Color(.displayP3, red: 45/255, green: 26/255, blue: 88/255, opacity: 1.0)
fileprivate let lightTextColor          = Color(.displayP3, red: 30/255, green: 21/255, blue: 49/255, opacity: 1.0)
fileprivate let darkTextColor           = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)
fileprivate let lightBaseColor          = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)
fileprivate let darkBaseColor           = Color(.displayP3, red: 30/255, green: 17/255, blue: 44/255, opacity: 1.0)
fileprivate let fadedBackgroundColorL   = Color(.displayP3, red: 177/255, green: 187/255, blue: 207, opacity: 1.0)
fileprivate let fadedBackgroundColorD   = Color(.displayP3, red: 0/255, green: 0/255, blue: 0/255, opacity: 1.0)

fileprivate let firstAccentColor        = Color(.displayP3, red: 99/255, green: 25/255, blue: 229/255, opacity: 1.0)
fileprivate let secondAccentColor       = Color(.displayP3, red: 1, green: 10/255, blue: 142/255, opacity: 1.0)
fileprivate let thirdAccentColor        = Color(.displayP3, red: 2/255, green: 160/255, blue: 250/255, opacity: 1.0)

struct LineGraph: View {
    
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        
        let shadowColor = colorScheme == .dark ? darkShadowColor : lightShadowColor
        let baseColor = colorScheme == .dark ? darkBaseColor : lightBaseColor
        
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
        
        let textColor = colorScheme == .dark ? darkTextColor : lightTextColor
        let darkFaded = colorScheme == .dark ? fadedBackgroundColorD : fadedBackgroundColorL
        
        VStack {
            ZStack {
                GeometryReader { gr in
                    RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                        .fill(darkFaded)
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
                .background(lightBgColor)
            LineGraph()
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
 
 If you have any suggestions for improvements,
 feel free to reach me at undead.pix3l@gmail.com
 */
