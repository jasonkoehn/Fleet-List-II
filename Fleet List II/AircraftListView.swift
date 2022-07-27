//
//  AircraftListView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

//struct AircraftListView: View {
//    @State var aircraft: [Aircraft] = []
//    @State var types: [Types] = []
//    var body: some View {
//        List {
//            ForEach(types, id: \.type) { types in
//                Section(types.model) {
//                    ForEach(aircraft, id: \.hex) { aircraft in
//                        if types.type == aircraft.type {
//                            NavigationLink(destination: {AircraftView(name: aircraft.operater, type: aircraft.type, model: types.model, registration: aircraft.registration, delivery_date: aircraft.delivery_date, hex: aircraft.hex, msn: aircraft.msn, ln: aircraft.ln, fn: aircraft.fn, firstflight: aircraft.firstflight)}) {
//                                HStack {
//                                    HStack {
//                                        Text(aircraft.registration)
//                                            .font(.system(size: 23))
//                                        Spacer()
//                                    }.frame(width: 120)
//                                    Text(aircraft.type)
//                                        .font(.system(size: 15))
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        .listStyle(PlainListStyle())
//        .navigationTitle("Aircraft")
//        .task {
//            loadTypes()
//            loadAircraft()
//        }
//        .refreshable {
//            Task {
//                await loadTypesfromapi()
//                saveTypes()
//                loadTypes()
//                await loadAircraftfromapi()
//                saveAircraft()
//                loadAircraft()
//            }
//        }
//    }
//    func loadAircraft() {
//        let manager = FileManager.default
//        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
//        let fileUrl = url.appendingPathComponent("aircraft.plist")
//        let data = try! Data(contentsOf: fileUrl)
//        let decoder = PropertyListDecoder()
//        let response = try! decoder.decode([Aircraft].self, from: data)
//        aircraft = response
//    }
//    func loadTypes() {
//        let manager = FileManager.default
//        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
//        let fileUrl = url.appendingPathComponent("types.plist")
//        let data = try! Data(contentsOf: fileUrl)
//        let decoder = PropertyListDecoder()
//        let response = try! decoder.decode([Types].self, from: data)
//        types = response
//        types.sort {
//            $0.model < $1.model
//        }
//    }
//}
//
//struct AircraftListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AircraftListView()
//    }
//}
