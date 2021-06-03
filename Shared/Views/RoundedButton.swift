// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let fontSize:               CGFloat = 20
fileprivate let fontHorizontalPadding:  CGFloat = 16
fileprivate var defaultRadius:          CGFloat = 24

fileprivate let lightShadowColor                = Color(.displayP3, red: 0.80, green: 0.80, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                 = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)

fileprivate let baseAccentColor                 = Color(.displayP3, red: 1, green: 0.04, blue: 0.56, opacity: 1.0)
fileprivate let baseDarkColor                   = Color(.displayP3, red: 0.78, green: 0, blue: 0.45, opacity: 1.0)

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
