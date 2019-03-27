//
//  GetMyLocation.swift
//  manadeeb
//
//  Created by hossam ahmed on 1/2/19.
//  Copyright © 2019 hossam ahmed. All rights reserved.
//


import UIKit
import GoogleMaps

class GetMyLocation :NSObject,CLLocationManagerDelegate{

    let locationManager = CLLocationManager()
    static let SharedInstance = GetMyLocation()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let defualts = UserDefaults.standard

    override init() {
        super.init()
        locationManager.delegate = self
       locationManager.requestLocation()
      //  locationManager.requestAlwaysAuthorization()
        //locationManager.startMonitoringVisits()
        locationManager.requestWhenInUseAuthorization()

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

    }
    //Fires when the user Allow/Doesn't allow the permission of getting the current location
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //Check if the user allowed us to access the current location
        //  if status == .authorizedWhenInUse {
        //Show "My Current Location" to the user
        //Start get the user's lcoation

        //  }
    }


    //Get the user location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            //Setup the map camera
            let defualts = UserDefaults.standard
            defualts.setValue(location.coordinate.latitude,forKey:"lat")
            defualts.setValue(location.coordinate.longitude,forKey:"lng")

            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
            let dateFormatter: DateFormatter = DateFormatter()
            // Set date format
            var date = Date()
            dateFormatter.dateFormat = "MM/dd/Y"
            dateFormatter.locale = Locale(identifier: "en_EN")
            // Apply date format
            let selectedDate: String = dateFormatter.string(from: date)


            if defualts.value(forKey: "room_id") != nil {
                let room_id = defualts.value(forKey:"room_id")
                print(room_id)
                let socket =  delegate.manager.defaultSocket
                let position = ["lat":"\(location.coordinate.latitude)","lng":"\(location.coordinate.longitude)"]
                socket.emit("change_position", "\(room_id!)" , position,"1")
            }
            //locationManager.stopUpdatingLocation()
        }
    }
}


