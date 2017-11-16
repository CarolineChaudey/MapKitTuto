//
//  Store.swift
//  MapKitTuto
//
//  Created by etudiant on 16/11/2017.
//  Copyright © 2017 caro. All rights reserved.
//

import CoreLocation

public class Store {
    public let name: String
    public let coordinate: CLLocationCoordinate2D
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }
}
