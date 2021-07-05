//
//  ComparedProgress.swift
//  swiftUIViews (iOS)
//
// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let lBgColor                = Color(.displayP3, red: 248/255, green: 250/255, blue: 251/255, opacity: 1.0)
fileprivate let dBgColor                = Color(.displayP3, red: 29/255, green: 19/255, blue: 44/255, opacity: 1.0)
fileprivate let lShadowColor            = Color(.displayP3, red: 242/255, green: 242/255, blue: 1, opacity: 1.0)
fileprivate let dShadowColor            = Color(.displayP3, red: 45/255, green: 26/255, blue: 88/255, opacity: 1.0)
fileprivate let lBaseColor              = Color(.displayP3, red: 1, green: 1, blue: 1, opacity: 1.0)
fileprivate let dBaseColor              = Color(.displayP3, red: 30/255, green: 17/255, blue: 44/255, opacity: 1.0)

fileprivate let pinkAccentColor         = Color(.displayP3, red: 1, green: 10/255, blue: 142/255, opacity: 1.0)
fileprivate let purpleAccentColor       = Color(.displayP3, red: 0.39, green: 0.1, blue: 0.9, opacity: 1.0)

fileprivate let detailFont              = Font.system(size: 18, weight: .semibold, design: .rounded)

struct ComparedProgress: View {
    /*
     Environtment is used just to make it easier to preview light and dark look in one view setup.
     You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let shadowColor = colorScheme == .dark ? dShadowColor : lShadowColor
        let baseColor   = colorScheme == .dark ? dBaseColor : lBaseColor
        
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .foregroundColor(baseColor)
                .shadow(color: shadowColor, radius: 24)
            VStack {
                ZStack {
                    HStack(spacing: 0) {
                        Capsule()
                            .fill(pinkAccentColor)
                            .frame(height: 8)
                        Capsule()
                            .fill(purpleAccentColor)
                            .frame(height: 8)
                    }
                    .padding(.bottom, 16)
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(pinkAccentColor)
                            .frame(width: 4, height: 32)
                        RoundedRectangle(cornerRadius: 32)
                            .fill(pinkAccentColor)
                            .frame(width: 4, height: 6)
                    }
                }
                Text("not bad")
                    .font(detailFont)
            }
            .padding(50)
        }
        .padding(50)
        .frame(height: 100)
    }
}

struct ComparedProgress_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ComparedProgress()
                .padding(50)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
                .background(lBgColor)
            ComparedProgress()
                .padding(50)
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
