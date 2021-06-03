/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

import SwiftUI

/* Defining all constants used in the view.
 Idealy, you would calculate these based on your view size or layout, or prefference. 👌*/
fileprivate let fontSize:               CGFloat = 20
fileprivate let fontHorizontalPadding:  CGFloat = 16
fileprivate var defaultRadius:          CGFloat = 24

fileprivate let lightShadowColor                = Color(.displayP3, red: 0.80, green: 0.80, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                 = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)

fileprivate let baseAccentColor                 = Color(.displayP3, red: 1, green: 0.04, blue: 0.56, opacity: 1.0)
fileprivate let baseDarkColor                   = Color(.displayP3, red: 0.78, green: 0, blue: 0.45, opacity: 1.0)

// MARK: IMPORTANT🚨
/* Idealy, you would not be using this view at all, only the code below the refactor line.
But i left it here for demonstration purposes */

/* This is a just a holder view for the button, as this is button style.
 You would need to adapt this to your app in a similar fashion as in this example. 👇*/
struct RoundedButtonView: View {
    
    /*
     Please please don't use the colors this way 😅 I am only adding it here so you can have a preview
     for both light and dark views. You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        
        let shadowColor = colorScheme == .dark ? darkShadowColor : lightShadowColor
        
        ZStack {
            Button("rounded button") {
                print("button tapped")
            }
            .buttonStyle(RoundedButtonStyle())
            .fixedSize()
            .shadow(color: shadowColor, radius: defaultRadius)
        }
    }
}
//------------------- REFACTOR ABOVE THIS LINE ---------------------------------------

struct RoundedButtonStyle: ButtonStyle {    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.system(size: fontSize, weight: .bold, design: .default))
            .frame(maxWidth: .infinity)
            .padding(.horizontal, fontHorizontalPadding)
            .padding()
            .background(configuration.isPressed ? baseDarkColor : baseAccentColor)
            .cornerRadius(defaultRadius)
            .foregroundColor(.white)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("rounded button") {}
                .buttonStyle(RoundedButtonStyle())
                .fixedSize()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
            
            Button("rounded button") {}
                .buttonStyle(RoundedButtonStyle())
                .fixedSize()
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
