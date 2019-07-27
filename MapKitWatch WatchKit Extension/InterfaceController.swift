//
//  InterfaceController.swift
//  MapKitWatch WatchKit Extension
//
//  Created by Patrick Stevens on 7/18/19.
//  Copyright © 2019 Patrick Stevens. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var map: WKInterfaceMap!
    
    var coords = CLLocationCoordinate2DMake(47.6207, -122.3495)
    var size: CLLocationDistance = 1000
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let point = MKMapPoint.init(coords)
        
     map.setVisibleMapRect(MKMapRect.init(x: point.x, y: point.y, width: size, height: size))
    }
    
    @IBAction func inAction() {
        if size > 100 {
            size -= 100
            let newRegion: MKCoordinateRegion = MKCoordinateRegion.init(center: coords, latitudinalMeters: size, longitudinalMeters: size)
            map.setRegion(newRegion)
        }
    }
    
    @IBAction func outAction() {
        size += 100
        let newRegion: MKCoordinateRegion = MKCoordinateRegion.init(center: coords, latitudinalMeters: size, longitudinalMeters: size)
        map.setRegion(newRegion)
    }
    

}
