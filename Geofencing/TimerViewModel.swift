//
//  TimerViewModel.swift
//  Geofencing
//
//  Created by khoirunnisa' rizky noor fatimah on 20/05/23.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var date: Date = .now
    @Published var isEnterRegion: Bool = false
    
    init() {
        // 👇🏻 Publishes every second
        Timer
            .publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .assign(to: &$date)
    }
    
}
