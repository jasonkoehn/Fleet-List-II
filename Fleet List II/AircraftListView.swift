//
//  AircraftListView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

struct AircraftListView: View {
    @State var aircraft: [Aircraft] = []
    var body: some View {
        List {
            ForEach(aircraft, id: \.hex) { aircraft in
                NavigationLink(destination: {AircraftView(name: aircraft.operater, type: aircraft.type, model: aircraft.model, registration: aircraft.registration, delivery_date: aircraft.delivery_date, hex: aircraft.hex, msn: aircraft.msn, ln: aircraft.ln, fn: aircraft.fn)}) {
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
        .listStyle(PlainListStyle())
        .navigationTitle("Aircraft")
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
    func loadAircraft() {
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileUrl = url.appendingPathComponent("aircraft.plist")
        let data = try! Data(contentsOf: fileUrl)
        let decoder = PropertyListDecoder()
        let response = try! decoder.decode([Aircraft].self, from: data)
        aircraft = response
    }
}

struct AircraftListView_Previews: PreviewProvider {
    static var previews: some View {
        AircraftListView()
    }
}
