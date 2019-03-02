//
//  DeliveryLocation .swift
//  manadeeb
//
//  Created by hossam ahmed on 11/25/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import MapKit
import GooglePlaces

class ClientLocation : UIViewController, GMSMapViewDelegate {
    
    var state_markers1 = GMSMarker()
    var prsenter : ReportsPsrsenterProtocol?
    
    ////// Store lat long
    var client_lat : String?
    var client_long : String?
    
    
    override func viewDidLoad() {
        view.addSubview(googlemap)
        googlemap.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        googlemap.centerXAnchor.constraint(equalTo:view.centerXAnchor ).isActive = true
        googlemap.widthAnchor.constraint(equalTo:  view.widthAnchor).isActive = true
        googlemap.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        googlemap.camera = GMSCameraPosition.camera(withLatitude: Double(client_lat!)!, longitude: Double(client_long!)! , zoom: 5, bearing: 0, viewingAngle: 0)
        
        
        self.state_markers1.position = CLLocationCoordinate2D(latitude: Double(client_lat!)!,longitude : Double(client_long!)!)
        self.state_markers1.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
        self.state_markers1.appearAnimation = .pop
        self.state_markers1.isFlat = true
        //self.state_markers1.icon = UIImage(named:"location")
        self.state_markers1.map = self.googlemap
    }
    
    lazy  var  googlemap : GMSMapView = {
        GMSServices.provideAPIKey("AIzaSyD8z2lWzm896P2g8VhaBfrVam0JL1BaiW0")
        let camera = GMSCameraPosition.camera(withLatitude: 0 ,  longitude :0, zoom: 5)
        let  googlemaps = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        googlemaps.translatesAutoresizingMaskIntoConstraints = false
        googlemaps.delegate = self
        return googlemaps
    }()
}
