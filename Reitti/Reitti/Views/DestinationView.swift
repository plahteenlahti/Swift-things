//
//  DestinationView.swift
//  Reitti
//
//  Created by Perttu Lähteenlahti on 16.1.2022.
//

import SwiftUI
import MapKit


struct DestinationView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 60.192059, longitude: 24.945831), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        NavigationView {
            VStack {
                
                Map(coordinateRegion: $region)
                    .frame(width: .infinity, height: .infinity)
            }
            .ignoresSafeArea(edges: .bottom)
            
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    
    static var previews: some View {
        DestinationView()
    }
}
