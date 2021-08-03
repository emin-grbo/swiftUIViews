#warning("""
    CONTRIBUTORS 📣: I marked some warning below so you would know which parts to edit.
    It is really important to keep more or less same style of code throughout the site,
    so you will most likely change the code below line #45, and initialize that view on line #38.
    Once you are done, feel free to delete warnings in this file.
    Happy designing!!
    """)

// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one big chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate let lBgColor                = Color(.displayP3, red: 248/255, green: 250/255, blue: 251/255, opacity: 1.0)
fileprivate let dBgColor                = Color(.displayP3, red: 29/255, green: 19/255, blue: 44/255, opacity: 1.0)
fileprivate var defaultRadius: CGFloat  = 18

struct YOURVIEW: View {
    var body: some View {
        VStack {
            // your view
        }
    }
}

struct YOURVIEW_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            YOURVIEW()
                .padding(100)
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
                .background(lBgColor)
            YOURVIEW()
                .padding(100)
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
