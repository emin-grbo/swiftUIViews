/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

import SwiftUI

/* Defining all constants used in the view.
 Idealy, you would calculate these based on your view size or layout, or prefference. 👌*/
fileprivate let fontSize: CGFloat                   = 20
fileprivate let fontHorizontalPadding: CGFloat      = 16
fileprivate let shadowRadius: CGFloat               = 10
fileprivate var defaultRadius: CGFloat              = 24

// browse symbols on https://sfsymbols.com or get the SFSymbols App https://developer.apple.com/sf-symbols
fileprivate let buttonIconString: String            = "hand.tap.fill"

fileprivate let lightShadowColor                    = Color(.displayP3, red: 0.80, green: 0.80, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                     = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)

fileprivate let purpleAccentColor                   = Color(.displayP3, red: 0.39, green: 0.1, blue: 0.9, opacity: 1.0)
fileprivate let purpleAccentColorDark               = Color(.displayP3, red: 0.37, green: 0.08, blue: 0.7, opacity: 1.0)

// MARK: IMPORTANT🚨
/* Idealy, you would not be using this view at all, only the code below the refactor line.
 But i left it here for demonstration purposes */

/* This is a just a holder view for the button, as this is button style.
 You would need to adapt this to your app in a similar fashion as in this example. 👇*/
struct SFSymbolButtonView: View {
    
    /*
     Please please don't use the colors this way 😅 I am only adding it here so you can have a preview
     for both light and dark views. You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let shadowColor = colorScheme == .dark ? darkShadowColor : lightShadowColor
        
        ZStack {
            Button("SFSymbol button") {
                print("button tapped")
            }
            .buttonStyle(SFSymbolButtonStyle(sfIconString: buttonIconString))
            .fixedSize()
            .shadow(color: shadowColor, radius: defaultRadius)
        }
    }
}
//------------------- REFACTOR ABOVE THIS LINE ---------------------------------------

struct SFSymbolButtonStyle: ButtonStyle {
    
    let sfIconString: String
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(systemName: sfIconString)
            configuration.label
                .font(Font.system(size: fontSize, weight: .bold, design: .default))
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .padding(.horizontal, fontHorizontalPadding)
        .padding()
        .background(configuration.isPressed ? purpleAccentColorDark : purpleAccentColor)
        .cornerRadius(defaultRadius)
    }
}

struct SFSymbolButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SFSymbolButtonView()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
            SFSymbolButtonView()
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
