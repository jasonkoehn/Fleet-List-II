//
//  SettingsView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/27/22.
//

import SwiftUI

//struct SettingsView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var expandableCountries: Bool = UserDefaults.standard.bool(forKey: "CountriesExpandable")
//    @State private var expandableTypes: Bool = UserDefaults.standard.bool(forKey: "TypesExpandable")
//    var body: some View {
//        VStack {
//            Toggle("Make Countries Expandable", isOn: $expandableCountries)
//                .padding()
//            Toggle("Make Types Expandable", isOn: $expandableTypes)
//                .padding()
//            Spacer()
//        }
//        .navigationTitle("Settings")
//        .navigationBarItems(trailing: Button(action: {
//            UserDefaults.standard.set(self.expandableCountries, forKey: "CountriesExpandable")
//            UserDefaults.standard.set(self.expandableTypes, forKey: "TypesExpandable")
//            presentationMode.wrappedValue.dismiss()
//        }){
//            Text("Save")
//                .font(.system(size: 16))
//        })
//    }
//}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
