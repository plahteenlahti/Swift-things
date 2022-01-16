//
//  ContentView.swift
//  Reitti
//
//  Created by Perttu Lähteenlahti on 16.1.2022.
//

import SwiftUI


struct Destination: Identifiable {
    var id = UUID()
    var address: String
}

extension Destination {
    static let samples = [
        Destination(address: "Koti"),
        Destination(address: "Maria 01"),
        Destination(address: "Rautatientori"),
    ]
}


private class DestinationViewModel: ObservableObject {
    @Published var destinations: [Destination] = Destination.samples
}


struct ContentView: View {
    @StateObject fileprivate var viewModel = DestinationViewModel()
    
    
    var body: some View {
        NavigationView(){
            
            VStack {
                List(viewModel.destinations) { destination in
                    Text("\(destination.address)")
                    
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Reitti")
    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
