//
//  MapViewController.swift
//  Sweet Grass
//
//  Created by yangshu lin on 3/20/16.
//  Copyright © 2016 HanFang. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Map"
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.01 , 0.01)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 39.153459, longitude: -86.538423)
        let theRegion:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
        
        myMap.setRegion(theRegion, animated: true)
        
        var anotation = MKPointAnnotation()
        anotation.coordinate = location
        anotation.title = "Sweet Grass"
        anotation.subtitle = "Restaurant"
        myMap.addAnnotation(anotation)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 1.0
        myMap.addGestureRecognizer(longPress)
        
        
    }
    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
