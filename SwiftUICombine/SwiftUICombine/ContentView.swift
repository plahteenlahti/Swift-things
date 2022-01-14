//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by Perttu Lähteenlahti on 13.1.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var contentOffset = CGFloat(0)
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: {offsetPoint in
                    contentOffset = offsetPoint.y
                }){
                    content
                }
                
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation(Animation.easeIn(duration: 0.5), value: contentOffset)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(colorScheme == .dark ? .white : Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))

    }
    
    var content: some View {
        VStack {
            VStack {
                NavigationLink(destination: FAQView()) {
                    MenuRow()
                }
            
                divider
                NavigationLink(destination: PackagesView()) {
                    MenuRow(title: "SwiftUI Packages", leftIcon: "square.stack.3d.up.fill")
                }
                
                divider
                
                Link(destination: URL(string: "https://www.youtube.com/channel/UCTIhfOopxukTIRkbXJ3kN-g")!, label: {
                    MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                })
            
            }
            .padding(16)
            .background(Color("Background1"))
            .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.top, 20)
            
            
            Text("Version 1.00")
                .foregroundColor(Color.white.opacity(0.7))
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .font(.footnote)
        }
        .foregroundColor(Color.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
    

    var divider: some View {
        Divider().background(Color.white).blendMode(.overlay)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
        }
}