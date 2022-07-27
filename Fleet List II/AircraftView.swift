//
//  AircraftView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

struct AircraftView: View {
    var name: String
    var type: String
    var model: String
    var registration: String
    var deliverydate: String
    var hex: String
    var msn: Int
    var ln: Int
    var fn: Int
    var firstflight: String
    @State var decodedDate = ""
    @State var years = 0
    @State var months = 0
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(4)
                .padding(.horizontal)
                .frame(height: 100)
            Text(registration)
                .font(.system(size: 50))
                .padding(15)
            Text(model)
                .font(.system(size: 35))
                .padding(.bottom)
            List {
                HStack {
                    HStack {
                        Text("Operator:")
                            .font(.system(size: 25))
                            .italic()
                        Spacer()
                    }
                    .frame(width: 115)
                    Text(name)
                        .font(.system(size: 25))
                    Spacer()
                }
                HStack {
                    HStack {
                        Text("Type:")
                            .font(.system(size: 25))
                            .italic()
                        Spacer()
                    }
                    .frame(width: 115)
                    Text(type)
                        .font(.system(size: 25))
                    Spacer()
                }
                HStack {
                    HStack {
                        Text("Delivery:")
                            .font(.system(size: 25))
                            .italic()
                        Spacer()
                    }
                    .frame(width: 115)
                    Text(decodedDate)
                        .font(.system(size: 25))
                    Spacer()
                }
                //
                HStack {
                    HStack {
                        Text("Age:")
                            .font(.system(size: 25))
                            .italic()
                        Spacer()
                    }
                    .frame(width: 115)
                    Text("\(years) years")
                        .font(.system(size: 25))
                    Text("\(months) months")
                        .font(.system(size: 25))
                        .padding(.horizontal)
                    Spacer()
                }
                //
                HStack {
                    HStack {
                        Text("Hex:")
                            .font(.system(size: 25))
                            .italic()
                        Spacer()
                    }
                    .frame(width: 115)
                    Text(hex)
                        .font(.system(size: 25))
                    Spacer()
                }
                HStack {
                    HStack {
                        Text("MSN:")
                            .font(.system(size: 25))
                            .italic()
                        Spacer()
                    }
                    .frame(width: 115)
                    Text(verbatim: "\(msn)")
                    
                        .font(.system(size: 25))
                    Spacer()
                }
                if ln != 0 {
                    HStack {
                        HStack {
                            Text("LN:")
                                .font(.system(size: 25))
                                .italic()
                            Spacer()
                        }
                        .frame(width: 115)
                        Text(verbatim: "\(ln)")
                            .font(.system(size: 25))
                        Spacer()
                    }
                }
                HStack {
                    HStack {
                        Text("FN:")
                            .font(.system(size: 25))
                            .italic()
                        Spacer()
                    }
                    .frame(width: 115)
                    Text(verbatim: "\(fn)")
                        .font(.system(size: 25))
                    Spacer()
                }
            }
            .listStyle(PlainListStyle())
            .disabled(true)
            Spacer()
        }
        .task {
            convertDate()
            convertToTime()
        }
    }
    func convertDate() {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.dateFormat = "yyyy-MM-dd"
        
        let dt = fmt.date(from: deliverydate)!
        
        fmt.dateFormat = "MMM d, yyyy"
        decodedDate = fmt.string(from: dt)
    }
    func convertToTime() {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.dateFormat = "yyyy-MM-dd"
        
        let dt = fmt.date(from: firstflight)!
        let tdt = Date()
        
        let diffs = Calendar.current.dateComponents([.year, .month, .day], from: dt, to: tdt)
        years = diffs.year!
        months = diffs.month!
    }
}

struct AircraftView_Previews: PreviewProvider {
    static var previews: some View {
        AircraftView(name: "Southwest Airlines", type: "B38M", model: "Boeing 737 MAX 8", registration: "N8707P", deliverydate: "2017-09-25", hex: "ABF9B1", msn: 36929, ln: 5992, fn: 8707, firstflight: "aircraft.firstflight")
    }
}
