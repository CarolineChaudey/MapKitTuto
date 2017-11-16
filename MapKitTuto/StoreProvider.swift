//
//  StoreProvider.swift
//  MapKitTuto
//
//  Created by etudiant on 16/11/2017.
//  Copyright © 2017 caro. All rights reserved.
//

import Foundation

public protocol StoreProvider: class { // pour pouvoir le mettre en weak
    var stores: [Store] { get }
}
