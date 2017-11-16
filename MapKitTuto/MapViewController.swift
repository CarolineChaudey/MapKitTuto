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
    }

    @IBAction func touchNewAppleStore() {
        let appleStoreViewComponent = NewAppleStoreViewController()
        appleStoreViewComponent.delegate = self
        self.present(PortraitNavigationController(rootViewController: appleStoreViewComponent), animated: true)
    }
}

extension MapViewController: NewAppleStoreViewControllerDelegate {
    func newAppleStoreViewController(_newAppleStoreViewController: NewAppleStoreViewController, didCreateStore store: Store) {
        _newAppleStoreViewController.dismiss(animated: true) {
            self.mapView.addAnnotation(store.annotation)
        }
    }
}

extension Store {
    public var annotation: MKAnnotation {
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.title = self.name
        pointAnnotation.coordinate = self.coordinate
        return pointAnnotation
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
