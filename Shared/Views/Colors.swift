/*
 This is just a "holder" of sorts for colors re-used throughout the project.
 Like a stash? 😐
 */

import SwiftUI

struct Colors {
    fileprivate let lightBaseColor    = Color(.displayP3, red: 0, green: 0, blue: 0, opacity: 1.0)
    fileprivate let darkBaseColor     = Color(.displayP3, red: 0.0666, green: 0.0274, blue: 0.1098, opacity: 1.0)
    
    fileprivate let lightBgColor        = Color(.displayP3, red: 0.9764, green: 0.9803, blue: 0.9882, opacity: 1.0)
    fileprivate let darkBgColor         = Color(.displayP3, red: 0.1176, green: 0.0784, blue: 0.1725, opacity: 1.0)
    
    fileprivate let lightShadowColor    = Color(.displayP3, red: 0.95, green: 0.95, blue: 1, opacity: 1.0)
    fileprivate let darkShadowColor     = Color(.displayP3, red: 0.1803, green: 0.0470, blue: 0.4627, opacity: 1.0)
    
    fileprivate let textColor           = Color(.displayP3, red: 0.117, green: 0.125, blue: 0.192, opacity: 1.0)
    fileprivate let purpleAccentColor   = Color(.displayP3, red: 0.39, green: 0.1, blue: 0.9, opacity: 1.0)
    fileprivate let pinkAccentColor     = Color(.displayP3, red: 1, green: 0.04, blue: 0.56, opacity: 1.0)
    fileprivate let blueAccentColor     = Color(.displayP3, red: 0.011, green: 0.631, blue: 0.984, opacity: 1.0)
    fileprivate let yellowAccent        = Color(.displayP3, red: 0.9647, green: 0.7607, blue: 0.3294, opacity: 1.0)
    fileprivate let orangeAccent        = Color(.displayP3, red: 0.9882, green: 0.4470, blue: 0.1764, opacity: 1.0)
    fileprivate let greenAccent         = Color(.displayP3, red: 0.2156, green: 0.9607, blue: 0.7843, opacity: 1.0)
}
