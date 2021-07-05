// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one big chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let cornerRadius:                   CGFloat = 24
fileprivate let fontSize:                       CGFloat = 20
fileprivate let fontHorizontalPadding:          CGFloat = 16
fileprivate let radiusTapped:                   CGFloat = 4
fileprivate let offsetTapped:                   CGFloat = 4
fileprivate let radiusUntapped:                 CGFloat = 8
fileprivate let offsetUntapped:                 CGFloat = 10

// light mode shadows
fileprivate let lightShadowLightColor   = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)
fileprivate let lightShadowDarkColor    = Color(.displayP3, red: 0.9254, green: 0.9333, blue: 0.9411, opacity: 1.0)
// dark mode shadows
fileprivate let darkShadowLightColor    = Color(.displayP3, red: 0.1725, green: 0.1137, blue: 0.2352, opacity: 1.0)
fileprivate let darkShadowDarkColor     = Color(.displayP3, red: 0.0666, green: 0.0352, blue: 0.1019, opacity: 1.0)

fileprivate let lightBgColor            = Color(.displayP3, red: 0.9764, green: 0.9803, blue: 0.9882, opacity: 1.0)
fileprivate let darkBgColor             = Color(.displayP3, red: 0.1176, green: 0.0784, blue: 0.1725, opacity: 1.0)
fileprivate let textAccentColor         = Color(.displayP3, red: 0.8, green: 0.8274, blue: 0.8784, opacity: 1.0)
fileprivate let baseAccentColor         = Color(.displayP3, red: 0.9764, green: 0.9803, blue: 0.9882, opacity: 1.0)

struct NeumorphButtonStyle: ButtonStyle {
    // Feel free to modify this shape to something else depending on how you are using it in the app.
    var shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Font.system(size: fontSize, weight: .bold, design: .default))
            .frame(maxWidth: .infinity)
            .padding(.horizontal, fontHorizontalPadding)
            .padding()
            .background(
                NeuMorphButton(isHighlighted: configuration.isPressed, shape: shape))
            .foregroundColor(textAccentColor)
    }
}

struct NeuMorphButton<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        
        let bgColor = colorScheme == .dark ? darkBgColor : lightBgColor
        let lightShadow = colorScheme == .dark ? darkShadowLightColor : lightShadowLightColor
        let darkShadow = colorScheme == .dark ? darkShadowDarkColor : lightShadowDarkColor
        
        ZStack {
            if isHighlighted {
                shape
                    .clipped()
                    .foregroundColor(bgColor)
                    .overlay(
                        shape
                            .stroke(bgColor, lineWidth: radiusTapped)
                            .shadow(radius: radiusTapped, x: offsetTapped, y: offsetTapped))
                    .overlay(
                        shape
                            .stroke(bgColor, lineWidth: 4)
                            .shadow(color: lightShadow, radius: radiusTapped, x: -offsetTapped, y: -offsetTapped))
                    .clipShape(shape)
            } else {
                shape
                    .clipped()
                    .foregroundColor(bgColor)
                    .shadow(color: lightShadow, radius: radiusUntapped, x: -offsetUntapped, y: -offsetUntapped)
                    .shadow(color: darkShadow, radius: radiusUntapped, x: offsetUntapped, y: offsetUntapped)
            }
        }
    }
}

struct NeumorphButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("neumorph button 👌") {}
                .buttonStyle(NeumorphButtonStyle())
                .fixedSize()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
            Button("neumorph button 👌") {}
                .buttonStyle(NeumorphButtonStyle())
                .fixedSize()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .background(darkBgColor)
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
