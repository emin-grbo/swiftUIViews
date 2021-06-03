// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let titleFont                           = Font.system(size: 16, weight: .bold, design: .rounded)
fileprivate let subTitleFont                        = Font.system(size: 12, weight: .bold, design: .rounded)
fileprivate var defaultRadius: CGFloat              = 18

fileprivate let lightShadowColor                    = Color(.displayP3, red: 0.95, green: 0.95, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                     = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)
fileprivate let greenAccent                         = Color(.displayP3, red: 0.2156, green: 0.9607, blue: 0.7843, opacity: 1.0)

struct TableCellImage: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                .foregroundColor(.white)
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
                        .foregroundColor(.black)
                    Text("cell subtitle")
                        .font(subTitleFont)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                Image(systemName: "chevron.forward")
                    .foregroundColor(.gray)
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
                .background(Color.gray)
            TableCellImage()
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
