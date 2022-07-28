//
//  AirlineListView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

struct AirlineListView: View {
    @State var airlines: [Airline] = []
    @State var alphabet: [String] = ["A", "B", "D", "F", "H", "J", "L", "P", "S", "U", "W"]
    @State var leftovers = ["C", "E", "G", "I", "K", "M", "N", "O", "Q", "R", "T", "V", "X", "Y", "Z"]
    var body: some View {
        List {
            ForEach(alphabet, id: \.self) { alphabet in
                Section(alphabet) {
                    ForEach(airlines, id: \.name) { airlines in
                        if airlines.name.first?.uppercased() == alphabet {
                            NavigationLink(destination: AirlineFleetView(name: airlines.name, country: airlines.country, website: airlines.website, iata: airlines.iata, icao: airlines.icao, callsign: airlines.callsign, types: airlines.types)) {
                                Text(airlines.name)
                                    .font(.system(size: 23))
                            }
                        }
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .task {
            loadAirlines()
        }
        .navigationTitle("Airlines")
        .refreshable {
            Task {
                await loadAirlinesfromapi()
                saveAirlines()
                loadAirlines()
            }
        }
    }
    func loadAirlines() {
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileUrl = url.appendingPathComponent("airlines.plist")
        let data = try! Data(contentsOf: fileUrl)
        let decoder = PropertyListDecoder()
        let response = try! decoder.decode([Airline].self, from: data)
        airlines = response
        airlines.sort {
            $0.name < $1.name
        }
    }
}

struct AirlineListView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineListView()
    }
}
