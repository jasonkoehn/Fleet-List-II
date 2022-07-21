//
//  LaunchView.swift
//  Fleet List II
//
//  Created by Jason Koehn on 7/20/22.
//

import SwiftUI

struct LaunchView: View {
    @State private var appHasLaunched: Bool = UserDefaults.standard.bool(forKey: "Launched")
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("Welcome To Fleet List")
                .font(.title)
                .italic()
                .foregroundColor(.white)
                .padding(40)
            Spacer()
            Spacer()
            Button(action: {
                appHasLaunched = true
                UserDefaults.standard.set(self.appHasLaunched, forKey: "Launched")
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
            .frame(width: 250, height: 70)
            .background(Color.blue)
            .cornerRadius(8)
            .padding(40)
            
            Spacer()
        }
        .ignoresSafeArea()
        .frame(width: 500, height: 1000)
        .background(Color.green)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
