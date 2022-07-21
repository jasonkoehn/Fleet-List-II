//
//  AirlineView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

struct AirlineView: View {
    var name: String
    var country: String
    var website: String
    var iata: String
    var icao: String
    var callsign: String
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(4)
                .frame(height: 150)
                .padding(10)
            Text(name)
                .font(.title)
                .padding(.bottom)
                .padding(.horizontal)
                HStack {
                    Spacer()
                    Text("IATA")
                        .italic()
                        .font(.headline)
                    Text(iata)
                        .font(.system(size: 20))
                    Spacer()
                    Text("ICOA")
                        .italic()
                        .font(.headline)
                    Text(icao)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("CALLSIGN")
                        .italic()
                        .font(.headline)
                    Text(callsign)
                        .font(.system(size: 20))
                    Spacer()
                }.padding(3)
                HStack {
                    Spacer()
                    Text("Website")
                        .italic()
                        .font(.headline)
                    Link(website, destination: URL(string: "https://www." + website)!)
                        .font(.system(size: 22))
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("Fleet Size")
                        .italic()
                        .font(.headline)
//                    Text("\(fleetsize)")
//                        .font(.system(size: 20))
                    Spacer()
                }.padding(3)
            Spacer()
        }
    }
}

struct AirlineView_Previews: PreviewProvider {
    static var previews: some View {
        AirlineView(name: "Southwest Airlines", country: "United States", website: "southwest.com", iata: "WN", icao: "SWA", callsign: "SOUTHWEST")
    }
}
