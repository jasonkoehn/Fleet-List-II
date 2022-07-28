//
//  Fleet_List_IIApp.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

@main
struct Fleet_List_IIApp: App {
    init() {
        Task {
            await loadCountriesfromapi()
            saveCountries()
            await loadAirlinesfromapi()
            saveAirlines()
        }
    }
    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}
