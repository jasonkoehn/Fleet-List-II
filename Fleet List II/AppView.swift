//
//  AppView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            NavigationView {
                AirlineListView()
            }
            .tabItem {
                Image(systemName: "airplane")
                Text("Airlines")
            }
            NavigationView {
                CountriesView()
            }.tabItem {
                Image(systemName: "list.bullet")
                Text("Countries")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
