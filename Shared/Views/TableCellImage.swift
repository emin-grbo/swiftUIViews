// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let titleFont               = Font.system(size: 16, weight: .bold, design: .rounded)
fileprivate let subTitleFont            = Font.system(size: 12, weight: .bold, design: .rounded)
fileprivate var defaultRadius: CGFloat  = 18

fileprivate let lBgColor                = Color(.displayP3, red: 248/255, green: 250/255, blue: 251/255, opacity: 1.0)
fileprivate let dBgColor                = Color(.displayP3, red: 29/255, green: 19/255, blue: 44/255, opacity: 1.0)
fileprivate let lShadowColor            = Color(.displayP3, red: 242/255, green: 242/255, blue: 1, opacity: 1.0)
fileprivate let dShadowColor            = Color(.displayP3, red: 45/255, green: 26/255, blue: 88/255, opacity: 1.0)
fileprivate let lBaseColor              = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)
fileprivate let dBaseColor              = Color(.displayP3, red: 30/255, green: 17/255, blue: 44/255, opacity: 1.0)
fileprivate let lTextColor              = Color(.displayP3, red: 30/255, green: 21/255, blue: 49/255, opacity: 1.0)
fileprivate let dTextColor              = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)

fileprivate let greenAccent             = Color(.displayP3, red: 54/255, green: 244/255, blue: 199/255, opacity: 1.0)

struct TableCellImage: View {
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let shadowColor = colorScheme == .dark ? dShadowColor : lShadowColor
        let baseColor   = colorScheme == .dark ? dBaseColor : lBaseColor
        let textColor   = colorScheme == .dark ? dTextColor : lTextColor
        
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                .foregroundColor(baseColor)
                .shadow(color: shadowColor, radius: defaultRadius)
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: defaultRadius,style: .continuous)
                        .fill(greenAccent)
                        .aspectRatio(1, contentMode: .fit)
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .font(titleFont)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("cell title")
                        .font(titleFont)
                        .foregroundColor(textColor)
                    Text("cell subtitle")
                        .font(subTitleFont)
                        .foregroundColor(textColor)
                        .opacity(0.8)
                }
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(textColor)
            }
            .frame(height: 54)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .frame(height: 86)
    }
}

struct TableCellImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TableCellImage()
                .padding(100)
                .fixedSize()
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
                .background(lBgColor)
            TableCellImage()
                .padding(100)
                .fixedSize()
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.dark)
                .background(dBgColor)
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
