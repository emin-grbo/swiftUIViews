// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let titleFont                           = Font.system(size: 16, weight: .bold, design: .rounded)
fileprivate var defaultRadius: CGFloat              = 24

fileprivate let lightShadowColor                    = Color(.displayP3, red: 0.95, green: 0.95, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                     = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)

fileprivate let graphAccentColor                    = Color(.displayP3, red: 0.011, green: 0.631, blue: 0.984, opacity: 1.0)
fileprivate let fadedBackgroundColor                = Color(.displayP3, red: 0.694, green: 0.737, blue: 0.815, opacity: 1.0)

struct Loader: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                .foregroundColor(.white)
            VStack {
                HStack {
                    Text("loading progress")
                        .font(titleFont)
                        .foregroundColor(.black)
                    Spacer()
                    Text("70%")
                        .font(titleFont)
                        .foregroundColor(.gray)
                }
                ZStack {
                    GeometryReader { gr in
                        RoundedRectangle(cornerRadius: defaultRadius)
                            .fill(fadedBackgroundColor)
                            .frame(height: 16)
                            .opacity(0.2)
                        RoundedRectangle(cornerRadius: defaultRadius)
                            .fill(graphAccentColor)
                            .padding(.trailing, 80)
                            .frame(height: 16)
                    }
                    .frame(height: 16)
                }
            }
            .padding(.horizontal, 24)
        }
        .frame(height: 86)
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Loader()
                .padding(100)
                .fixedSize()
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
                .background(Color.gray)
            Loader()
                .padding(100)
                .fixedSize()
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
