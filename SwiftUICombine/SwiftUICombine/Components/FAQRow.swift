//
//  FAQRow.swift
//  SwiftUICombine
//
//  Created by Perttu Lähteenlahti on 15.1.2022.
//

import SwiftUI

struct FAQRow: View {
    var faq: FAQ

    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Text(faq.question)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(faq.answer)
                .font(.subheadline)
                .opacity(0.7)
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FAQRow_Previews: PreviewProvider {
    static var previews: some View {
        FAQRow(faq: faqData[0])
    }
}
