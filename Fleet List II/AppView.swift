//
//  AppView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

struct AppView: View {
    @AppStorage("Launched") var appLaunched = false
    var body: some View {
        if appLaunched == false {
            LaunchView()
        } else {
            TabView {
                NavigationView {
                    AirlineListView()
                }
                .tabItem {
                    Image(systemName: "list.bullet")
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
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
