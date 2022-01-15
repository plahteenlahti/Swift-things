//
//  FaqView.swift
//  SwiftUICombine
//
//  Created by Perttu Lähteenlahti on 13.1.2022.
//

import SwiftUI

struct FAQView: View {
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        ZStack(alignment: .top){
            TrackableScrollView(offsetChanged: { offsetPoint in
                contentOffset = offsetPoint.y
            }) {
                content
            }
            VisualEffectBlur(blurStyle: .systemMaterial)
                .opacity(contentOffset < -16 ? 1 : 0)
                .animation(Animation.easeIn(duration: 0.5), value: contentOffset)
                .ignoresSafeArea()
                .frame(height: 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("FAQ").font(.largeTitle)
        .background(Color("Background 2").edgesIgnoringSafeArea(.all))
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            ForEach(faqData, id: \.id) { faq in
                FAQRow(faq: faq)
            }
            Text("Have any question?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .opacity(0.7)
        }
        .padding(.horizontal, 20)
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
