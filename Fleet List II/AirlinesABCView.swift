//
//  AirlinesABCView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/27/22.
//

import SwiftUI

struct CountriesView: View {
    @State var countries: [Country] = []
    var body: some View {
        List {
            ForEach(countries, id: \.name) { country in
                NavigationLink(destination: {AirlinesView(countryName: country.name)}) {
                    Text(country.name)
                        .font(.system(size: 20))
                }
            }
        }
        .listStyle(PlainListStyle())
        .task {
            loadCountries()
        }
        .navigationTitle("Countries")
        .refreshable {
            Task {
                await loadCountriesfromapi()
                saveCountries()
                loadCountries()
            }
        }
    }
    func loadCountries() {
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileUrl = url.appendingPathComponent("countries.plist")
        if let data = try? Data(contentsOf: fileUrl) {
            let decoder = PropertyListDecoder()
            let response = try! decoder.decode([Country].self, from: data)
            countries = response
            countries.sort {
                $0.name < $1.name
            }
        } else {
            Task {
                await loadCountriesfromapi()
                saveCountries()
                loadCountries()
            }
        }
    }
}


struct AirlinesView: View {
    @State var airlines: [Airline] = []
    var countryName: String
    var body: some View {
        List {
            ForEach(airlines, id: \.name) { airlines in
                if airlines.country == countryName {
                    NavigationLink(destination: AirlineFleetView(name: airlines.name, country: airlines.country, website: airlines.website, iata: airlines.iata, icao: airlines.icao, callsign: airlines.callsign, types: airlines.types)) {
                        Text(airlines.name)
                            .font(.system(size: 23))
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
        if let data = try? Data(contentsOf: fileUrl) {
            let decoder = PropertyListDecoder()
            let response = try! decoder.decode([Airline].self, from: data)
            airlines = response
            airlines.sort {
                $0.name < $1.name
            }
        } else {
            Task {
                await loadAirlinesfromapi()
                saveAirlines()
                loadAirlines()
            }
        }
    }
}
