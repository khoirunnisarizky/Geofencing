//
//  ContentView.swift
//  Geofencing
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timerViewModel: TimerViewModel
    
    var body: some View {
        
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text(timerViewModel.date.formatted(date: .omitted, time: .standard))
                Text("User at region:  \(timerViewModel.isEnterRegion ? "YES" : "NO")")
            }
            .padding()
//            .toolbar(.hidden, for: .tabBar)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TimerViewModel())
    }
}
