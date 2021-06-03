/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

import SwiftUI

/* Defining all constants used in the view.
 Idealy, you would calculate these based on your view size or layout, or prefference. 👌*/
fileprivate let defaultFont                         = Font.system(size: 32, weight: .bold, design: .rounded)
fileprivate var defaultRadius: CGFloat              = 24
fileprivate let lineWidth: CGFloat                  = 12

fileprivate let lightShadowColor                    = Color(.displayP3, red: 0.95, green: 0.95, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                     = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)

fileprivate let yellowAccent                        = Color(.displayP3, red: 0.9647, green: 0.7607, blue: 0.3294, opacity: 1.0)
fileprivate let orangeAccent                        = Color(.displayP3, red: 0.9882, green: 0.4470, blue: 0.1764, opacity: 1.0)

// MARK: IMPORTANT🚨
/* Idealy, you would not be using this view at all, only the code below the refactor line.
 But i left it here for demonstration purposes */
struct SquircleGraphIconView: View {
    
    var body: some View {
        ZStack {
            SquircleGraphIcon()
        }
    }
}
//------------------- REFACTOR ABOVE THIS LINE ---------------------------------------

struct SquircleGraphIcon: View {
    
    /*
     Please please don't use the colors this way 😅 I am only adding it here so you can have a preview
     for both light and dark views. You should create a new semantic color in the assets and use it that way 👌
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
