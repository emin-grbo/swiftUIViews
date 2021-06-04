/* Use this view only for preview. All view data must be contained within one .swift file,
 but here you can place it for preview and its quite ok to leave it there. */

import SwiftUI

fileprivate let lightBgColor = Color(.displayP3, red: 0.9764, green: 0.9803, blue: 0.9882, opacity: 1.0)
fileprivate let darkBgColor = Color(.displayP3, red: 0.1176, green: 0.0784, blue: 0.1725, opacity: 1.0)

struct Previewer: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let baseBGColor = colorScheme == .dark ? darkBgColor : lightBgColor
        
        ZStack {
            baseBGColor
            LineGraph() // idealy you would only change this line.
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Previewer_Previews: PreviewProvider {
    static var previews: some View {
        Previewer()
            .frame(width: 500, height: 500)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Preview")
    }
}
