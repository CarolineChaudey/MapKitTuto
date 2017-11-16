//
//  MainStoreViewController.swift
//  MapKitTuto
//
//  Created by etudiant on 16/11/2017.
//  Copyright © 2017 caro. All rights reserved.
//

import UIKit

class MainStoreViewController: UIViewController {

    @IBOutlet weak var childContentView: UIView!
    
    lazy var mapViewController: MapViewController = { // lazy ne va exécuter la méthode qu'une seule fois
        return MapViewController()
    }()
    
    lazy var listViewController: StoreListViewController = {
        return StoreListViewController()
    }()
    
    public var visibleViewControler: UIViewController {
        if self.mapViewController.view.window != nil {
            return self.mapViewController
        }
        return self.listViewController
    }
    
    @IBAction func switchButton() {
        UIView.beginAnimations("flip_animation", context: nil)
        UIView.setAnimationTransition(.flipFromRight, for: self.childContentView, cache: false)
        UIView.setAnimationDuration(2)
        
        let visible = self.visibleViewControler
        self.removeVisibleChildController(visible)
        if visible == self.mapViewController {
            self.addChildViewController(self.listViewController, in: self.childContentView)
        } else {
            self.addChildViewController(self.mapViewController, in: self.childContentView)
        }
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChildViewController(self.mapViewController, in: self.childContentView)
    }
    
    func addChildViewController(_ childViewController: UIViewController, in subview: UIView) {
        guard let view = childViewController.view else {
            return
        }
        view.frame = subview.bounds
        view.autoresizingMask = UIViewAutoresizing(rawValue: 0b111111)
        subview.addSubview(view)
        self.addChildViewController(childViewController)
    }
    
    func removeVisibleChildController(_ childController: UIViewController) {
        childController.removeFromParentViewController()
        childController.view.removeFromSuperview()
    }
}
