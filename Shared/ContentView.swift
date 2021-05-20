//
//  ContentView.swift
//  Shared
//
//  Created by Emin Grbo on 28/02/2021.
//

import SwiftUI

fileprivate let lightBgColor = Color(.displayP3, red: 0.9764, green: 0.9803, blue: 0.9882, opacity: 1.0)
fileprivate let darkBgColor = Color(.displayP3, red: 0.1176, green: 0.0784, blue: 0.1725, opacity: 1.0)
//fileprivate let baseAccentColor     = Color(.displayP3, red: 0.39, green: 0.1, blue: 0.9, opacity: 1.0)
//fileprivate let backgroundColor     = Color(.displayP3, red: 0.9725, green: 0.9607, blue: 0.9882, opacity: 1.0)

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        let baseBGColor = colorScheme == .dark ? darkBgColor : lightBgColor
        
        ZStack {
            baseBGColor
            RoundedButtonView()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 500, height: 500)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Preview")
    }
}
