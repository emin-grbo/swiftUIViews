// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one big chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let defaultFont                         = Font.system(size: 32, weight: .bold, design: .rounded)
fileprivate var defaultRadius: CGFloat              = 24
fileprivate let lineWidth: CGFloat                  = 12

fileprivate let lightShadowColor                    = Color(.displayP3, red: 0.95, green: 0.95, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                     = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)

fileprivate let yellowAccent                        = Color(.displayP3, red: 0.9647, green: 0.7607, blue: 0.3294, opacity: 1.0)
fileprivate let orangeAccent                        = Color(.displayP3, red: 0.9882, green: 0.4470, blue: 0.1764, opacity: 1.0)

struct SquircleGraphIcon: View {
    
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let shadowColor = colorScheme == .dark ? darkShadowColor : lightShadowColor
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: defaultRadius * 2, style: .continuous)
                    .fill(yellowAccent)
                    .shadow(color: shadowColor, radius: defaultRadius)
                RoundedRectangle(cornerRadius: defaultRadius * 2, style: .continuous)
                    .trim(from: 0, to: 0.5)
                    .stroke(orangeAccent, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                Image(systemName: "photo.on.rectangle.angled")
                    .font(defaultFont)
                    .foregroundColor(.white)
            }
            .padding(120)
            .aspectRatio(1, contentMode: .fit)
        }
    }
}

struct SquircleGraphIcon_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SquircleGraphIcon()
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
                .frame(width: 400, height: 400)
            SquircleGraphIcon()
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.dark)
                .frame(width: 400, height: 400)
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
