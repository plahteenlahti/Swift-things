//
//  CertificatesView.swift
//  SwiftUICombine
//
//  Created by Perttu Lähteenlahti on 15.1.2022.
//

import SwiftUI

struct CertificatesView: View {
    @StateObject var certificateVM = CertificateViewModel()
    @State private var selection: Int = 0
    
    
    var body: some View {
        VStack {
            if certificateVM.certificates.count > 0 {
                TabView(selection: $selection) {
                    ForEach(certificateVM.certificates.indices, id: \.self) { index in
                        CertificateCard(selection: $selection)
                            .padding(.horizontal, 8)
                            .environmentObject(certificateVM)
                    }
                }
                .tabViewStyle(.page)
            } else {
                ProgressView()
            }
        }
        .background(AccountBackground())
    }
    
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
