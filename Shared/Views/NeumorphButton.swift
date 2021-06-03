/* For easy of copy/pastability, all code is in one bug chunk.
Be a dear and refactor this out any way you see fit 🤘 */

import SwiftUI

/* Defining all constants used in the view.
 Idealy, you would calculate these based on your view size or layout, or prefference. 👌*/
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

// MARK: IMPORTANT🚨
/* Idealy, you would not be using this view at all, only the code below the refactor line.
But i left it here for demonstration purposes */

/* This is a just a holder view for the button, as this is button style.
 You would need to adapt this to your app in a similar fashion as in this example. 👇*/
struct NeumorphButtonView: View {
    var body: some View {
        ZStack {
            Button("neumorph button 👌") {
                print("button tapped")
            }
            .buttonStyle(NeumorphButtonStyle())
            .fixedSize()
        }
    }
}
//------------------- REFACTOR ABOVE THIS LINE ---------------------------------------

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
     Please please don't use the colors this way 😅 I am only adding it here so you can have a preview
     for both light and dark views. You should create a new semantic color in the assets and use it that way 👌
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
