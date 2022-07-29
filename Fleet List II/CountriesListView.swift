//
//  CountriesListView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/28/22.
//

import SwiftUI

struct CountriesListView: View {
    var body: some View {
        List {
            ForEach(countries, id: \.self) { country in
                NavigationLink(destination: {AirlinesByCountryView(countryName: country)}) {
                    Text(country)
                        .font(.system(size: 20))
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Countries")
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
