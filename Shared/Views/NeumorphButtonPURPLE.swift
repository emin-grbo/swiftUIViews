///* For easy of copy/pastability, all code is in one bug chunk.
//Be a dear and refactor this out any way you see fit 🤘 */
//
//import SwiftUI
//
///* Defining all constants used in the view.
// Idealy, you would calculate these based on your view size or layout, or prefference. 👌*/
//fileprivate let cornerRadius:                   CGFloat = 24
//fileprivate let fontSize:                       CGFloat = 20
//fileprivate let fontHorizontalPadding:          CGFloat = 16
//fileprivate let radiusTapped:                   CGFloat = 3
//fileprivate let radiusUntapped:                 CGFloat = 8
//fileprivate let offsetTapped:                   CGFloat = 3
//fileprivate let offsetUntapped:                 CGFloat = 10
//
//fileprivate let baseAccentColor     = Color(.displayP3, red: 0.3960, green: 0.1058, blue: 0.8980, opacity: 1.0)
//fileprivate let shadowLightColor    = Color(.displayP3, red: 0.4352, green: 0.1686, blue: 0.8980, opacity: 1.0)
//fileprivate let shadowDarkColor     = Color(.displayP3, red: 0.3529, green: 0.0980, blue: 0.7960, opacity: 1.0)
//
///* This is a just a holder view for the button, as this is button style.
// You would need to adapt this to your app in a similar fashion as in this example. 👇*/
//struct NeumorphButtonView: View {
//    var body: some View {
//        ZStack {
//            baseAccentColor
//            Button("neumorph 👌") {
//                print("button tapped")
//            }
//            .buttonStyle(NeumorphButtonStyle())
//            .fixedSize()
//        }
//    }
//}
////------------------- REFACTOR ABOVE THIS LINE ---------------------------------------
//
//struct NeumorphButtonStyle: ButtonStyle {
//    // Feel free to modify this shape to something else depending on how you are using it in the app.
//    var shape = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
//    
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .font(Font.system(size: fontSize, weight: .bold, design: .default))
//            .frame(maxWidth: .infinity)
//            .padding(.horizontal, fontHorizontalPadding)
//            .padding()
//            .background(
//                NeuMorphButton(isHighlighted: configuration.isPressed, shape: shape))
//            .foregroundColor(.white)
//    }
//}
//
//struct NeuMorphButton<S: Shape>: View {
//    var isHighlighted: Bool
//    var shape: S
//    
//    var body: some View {
//        ZStack {
//            if isHighlighted {
//                shape
//                    .clipped()
//                    .foregroundColor(baseAccentColor)
//                    .overlay(
//                        shape
//                            .stroke(baseAccentColor, lineWidth: 4)
//                            .shadow(radius: 5, x: 4, y: 4))
//                    .overlay(
//                        shape
//                            .stroke(baseAccentColor, lineWidth: 4)
//                            .shadow(color: shadowLightColor, radius: radiusTapped, x: -offsetTapped, y: -offsetTapped))
//                    .clipShape(shape)
//            } else {
//                shape
//                    .clipped()
//                    .foregroundColor(baseAccentColor)
//                    .shadow(color: shadowLightColor, radius: radiusUntapped, x: -offsetUntapped, y: -offsetUntapped)
//                    .shadow(color: shadowDarkColor, radius: radiusUntapped, x: offsetUntapped, y: offsetUntapped)
//            }
//        }
//    }
//}
//
///*
// Awesome Sauce!
// Thank you for getting one of my views, hope you are happy with it 👌
// Consider helping this train rollin 🚂 on my Patreon -> https://www.patreon.com/swiftui
// 
// If you have any suggestions for improvements,
// feel free to reach me at undead.pix3l@gmail.com
// */
