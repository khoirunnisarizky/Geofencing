//
//  SceneDelegate.swift
//  Geofencing
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/23.
//

import UIKit
import SwiftUI
import CoreLocation

class SceneDelegate:  UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var timerViewModel = TimerViewModel()
    let locationManager = CLLocationManager()
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = TabView {
            ContentView()
                .environmentObject(timerViewModel)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        // Request “Always on permissions” from the user to receive events related to region monitoring
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        // Monitoring region initiation
        let locationCoordinates = CLLocationCoordinate2D(latitude: -6.278148, longitude: 106.634674) // My room at Pagedangan
        monitorRegionAtLocation(center: locationCoordinates, identifier: "Kos Anis BSD")
        
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("enter")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("active")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("resigned")
    }
}
