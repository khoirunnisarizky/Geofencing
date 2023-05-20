//
//  SceneDelegate+Ext.swift
//  Geofencing
//
//  Created by khoirunnisa' rizky noor fatimah on 04/05/23.
//

import UIKit
import SwiftUI
import CoreLocation

extension SceneDelegate: CLLocationManagerDelegate {
   
    // MARK: Listening to geofencing events with didEnter and didExit
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        // Handle logic enter region
        
        // Shows alert (if available)
        timerViewModel.isEnterRegion = true
        print("Did ENTER the region")
        
        if UIApplication.shared.applicationState == .active {
            
        } else {
            
            let body = "You arrived at " + region.identifier
            let notificationContent = UNMutableNotificationContent()
            notificationContent.body = body
            notificationContent.sound = .default
            notificationContent.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(
                identifier: "location_change",
                content: notificationContent,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error: \(error)")
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        // Handle logic exit region
        
        // Shows alert (if available)
        timerViewModel.isEnterRegion = false
        print("Did EXIT the region")
        
        if UIApplication.shared.applicationState == .active {
            
        } else {
            
            let body = "You left " + region.identifier
            let notificationContent = UNMutableNotificationContent()
            notificationContent.body = body
            notificationContent.sound = .default
            notificationContent.badge = UIApplication.shared.applicationIconBadgeNumber + 1 as NSNumber
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(
                identifier: "location_change",
                content: notificationContent,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error: \(error)")
                }
            }
        }
    }
    
    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String) {
        
        // Make sure the devices supports region monitoring
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            
            // Set the radius of monitoring distance
            let maxDistance = locationManager.maximumRegionMonitoringDistance
            // For the sake of this project we will use the maxmimum allowed distance.
            // When you are going production, it is recommended to optimize this value according to your needs to be less resource intensive
            
            // Register the region.
            let region = CLCircularRegion(center: center,
                                          radius: 2, identifier: identifier)
            region.notifyOnEntry = true
            region.notifyOnExit = true
            
            locationManager.startMonitoring(for: region)
        }
    }
}
