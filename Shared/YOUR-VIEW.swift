#warning("""
    CONTRIBUTORS 📣: I marked some warning below so you would know which parts to edit.
    It is really important to keep more or less same style of code throughout the site,
    so you will most likely change the code below line #45, and initialize that view on line #38.
    Once you are done, feel free to delete warnings in this file.
    Happy designing!!
    """)

// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one bug chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants or first view at all, only the code below the refactor line.
 I am leaving the initial view here just for easier usage example or possible extraction. Hope that works 👌 */

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate var defaultRadius: CGFloat              = 18
fileprivate let lightShadowColor                    = Color(.displayP3, red: 0.95, green: 0.95, blue: 1, opacity: 1.0)
fileprivate let darkShadowColor                     = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)

struct YOURVIEWPRESENTER: View {

    /*
     Please please don't use the colors this way 😅 I am only adding it here so you can have a preview
     for both light and dark views. You should create a new semantic color in the assets and use it that way 👌
     */
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let shadowColor = colorScheme == .dark ? darkShadowColor : lightShadowColor
        
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius, style: .continuous)
                .foregroundColor(.white)
                .shadow(color: shadowColor, radius: defaultRadius)
            #warning("// idealy you would only change the line below in this section")
            YOURVIEW()
        }
        .padding(.horizontal, 60)

    }
}
//------------------- REFACTOR ABOVE THIS LINE ---------------------------------------

#warning("anything below this line is yours have at it! And thank you for contributing! Make sure to leave your twitter handle here")
struct YOURVIEW: View {
    var body: some View {
        VStack {
            
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
