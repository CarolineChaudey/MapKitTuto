//
//  MapViewController.swift
//  MapKitTuto
//
//  Created by etudiant on 15/11/2017.
//  Copyright © 2017 caro. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() {
            let manager = CLLocationManager()
            manager.requestWhenInUseAuthorization()
            self.locationManager = manager
        }
        self.mapView.delegate = self
        
        let opera = MKPointAnnotation()
        opera.coordinate = .init(latitude: 48.8725125, longitude: 2.3311423)
        opera.title = "Apple Store"
        opera.subtitle = "Ouverture 8h-22h"
        
        let louvre = MKPointAnnotation()
        louvre.coordinate = .init(latitude: 48.8629555, longitude: 2.3322693)
        louvre.title = "Le Louvres"
        louvre.subtitle = "Ouverture 8h-22h"
        
        self.mapView.addAnnotations([opera, louvre])
    }

}

extension MapViewController : MKMapViewDelegate {
    public static let appleStoreIdentifier = "ASI"
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: MapViewController.appleStoreIdentifier)
        if let reused = view {
            reused.annotation = annotation
            return reused
        }
        let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: MapViewController.appleStoreIdentifier)
        pinAnnotation.canShowCallout = true
        pinAnnotation.pinTintColor = .yellow
        return pinAnnotation
    }
}
