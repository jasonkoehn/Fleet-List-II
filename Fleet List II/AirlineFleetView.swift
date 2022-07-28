//
//  AirlineFleetView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

struct AirlineFleetView: View {
    @State var aircraftBeforeSave: [Aircraft] = []
    @State var aircraft: [Aircraft] = []
    var name: String
    var country: String
    var website: String
    var iata: String
    var icao: String
    var callsign: String
    var types: [Types] = []
    var body: some View {
        VStack {
            NavigationLink(destination: {AirlineView(name: name, country: country, website: website, iata: iata, icao: icao, callsign: callsign, fleetsize: aircraft.count)}) {
                VStack {
                    Image(name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(4)
                        .frame(height: 80)
                        .padding(.horizontal, 10)
                    HStack {
                        Spacer()
                        Text("IATA")
                            .italic()
                            .font(.subheadline)
                        Text(iata)
                        Spacer()
                        Text("ICOA")
                            .italic()
                            .font(.subheadline)
                        Text(icao)
                        Spacer()
                        Text("Callsign")
                            .italic()
                            .font(.subheadline)
                        Text(callsign)
                        Spacer()
                    }.foregroundColor(.primary)
                }
            }
            List {
                ForEach(types, id: \.type) { types in
                    Section(types.model) {
                        ForEach(aircraft, id: \.hex) { aircraft in
                            if aircraft.operater == name && aircraft.type == types.type {
                                NavigationLink(destination: {AircraftView(name: name, type: aircraft.type, model: types.model, registration: aircraft.registration, deliverydate: aircraft.deliverydate, hex: aircraft.hex, msn: aircraft.msn, ln: aircraft.ln, fn: aircraft.fn, firstflight: aircraft.firstflight)}) {
                                    HStack {
                                        HStack {
                                            Text(aircraft.registration)
                                                .font(.system(size: 23))
                                            Spacer()
                                        }.frame(width: 120)
                                        Text(aircraft.type)
                                            .font(.system(size: 15))
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(name)
            .task {
                loadAircraft()
            }
            .refreshable {
                Task {
                    await loadAircraftfromapi()
                    saveAircraft()
                    loadAircraft()
                }
            }
        }
    }
    func loadAircraftfromapi() async {
        let fileName = String(name.filter { !" ".contains($0) })
        guard let url = URL(string: "https://jasonkoehn.github.io/FleetListII/"+fileName+".json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Aircraft].self, from: data) {
                aircraftBeforeSave = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
    func saveAircraft() {
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileUrl = url.appendingPathComponent(name+".plist")
        manager.createFile(atPath: fileUrl.path, contents: nil, attributes: nil)
        let encoder = PropertyListEncoder()
        let encodedData = try! encoder.encode(aircraftBeforeSave)
        try! encodedData.write(to: fileUrl)
    }
    func loadAircraft() {
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileUrl = url.appendingPathComponent(name+".plist")
        if let data = try? Data(contentsOf: fileUrl) {
            let decoder = PropertyListDecoder()
            let response = try! decoder.decode([Aircraft].self, from: data)
            aircraft = response
            aircraft.sort {
                $0.registration < $1.registration
            }
        } else {
            Task {
                await loadAircraftfromapi()
                saveAircraft()
                loadAircraft()
            }
        }
    }
}


