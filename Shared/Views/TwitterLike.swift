// MARK: IMPORTANT🚨
/* For easy of copy/pastability, all code is in one big chunk.
 Be a dear and refactor this out any way you see fit 🤘 */

/* Idealy, you would NOT be using pre-defined constants in this way, so keep that in mind.*/

import SwiftUI

/* Defining all constants used in the view.*/
fileprivate var defaultRadius:              CGFloat = 18

fileprivate let fadedBackgroundColor                = Color(.displayP3, red: 0.694, green: 0.737, blue: 0.815, opacity: 1.0)

struct TwitterLike: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var scale: CGFloat           = 0
    @State var textOpacity: Double      = 1
    @State var offset: CGFloat          = 0
    @State var isLiked                  = false
    
    var body: some View {
        let circleMaskColor = colorScheme == .dark ? Color.black : Color.white
        ZStack {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 12, height: 12, alignment: .center)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.red)
                .offset(x: 0, y: offset)
                .opacity(textOpacity)
                .padding(.bottom, 0)
                .padding(.trailing, 20)
                .animation(.easeInOut(duration: 1).delay(0.5))
            Image(systemName: "plus")
                .resizable()
                .frame(width: 12, height: 12, alignment: .center)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.red)
                .offset(x: 0, y: offset)
                .opacity(textOpacity)
                .padding(.bottom, 20)
                .animation(.easeInOut(duration: 1).delay(0.8))
            Image(systemName: "plus")
                .resizable()
                .frame(width: 12, height: 12, alignment: .center)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(.red)
                .offset(x: 0, y: offset)
                .opacity(textOpacity)
                .padding(.bottom, 00)
                .padding(.trailing, -20)
                .animation(.easeInOut(duration: 1).delay(1))
            Circle()
                .frame(width: 36, height: 36, alignment: .center)
                .foregroundColor(circleMaskColor)
            Circle()
                .frame(width: 35, height: 35, alignment: .center)
                .foregroundColor(Color.red)
                .scaleEffect(scale)
                .animation(.spring())
            Circle()
                .frame(width: 36, height: 36, alignment: .center)
                .foregroundColor(circleMaskColor)
                .scaleEffect(scale)
                .animation(.spring().delay(0.3))
            if !isLiked {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(fadedBackgroundColor)
            }
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(.red)
                .scaleEffect(scale)
                .animation(.interpolatingSpring(
                            mass: 1,
                            stiffness: 100,
                            damping: 10,
                            initialVelocity: 2).delay(0.5))
            Text("+1")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .scaleEffect(scale)
                .animation(.interpolatingSpring(
                            mass: 1,
                            stiffness: 100,
                            damping: 10,
                            initialVelocity: 2).delay(0.5))
                .opacity(textOpacity)
                .animation(.easeInOut(duration: 0.5).delay(1.5))
        }
        .onTapGesture {
            scale = isLiked       ? 0 : 1
            textOpacity = isLiked ? 1 : 0
            offset = isLiked      ? 0 : -30
            isLiked.toggle()
        }
    }
}

struct TwitterLike_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TwitterLike()
                .padding(100)
                .fixedSize()
                .previewLayout(PreviewLayout.sizeThatFits)
                .preferredColorScheme(.light)
            TwitterLike()
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
