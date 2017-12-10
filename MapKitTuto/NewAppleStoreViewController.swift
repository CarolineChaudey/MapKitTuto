//
//  NewAppleStoreViewController.swift
//  MapKitTuto
//
//  Created by etudiant on 15/11/2017.
//  Copyright © 2017 caro. All rights reserved.
//

import UIKit
import CoreLocation

public protocol NewAppleStoreViewControllerDelegate: class {
    func newAppleStoreViewController(_newAppleStoreViewController: NewAppleStoreViewController, didCreateStore store: Store)
}

public class NewAppleStoreViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    // weak : la variable ne sera pas mémorisée si détruite
    // strong: même si détruite, sera mémorisé tant que la classe propriétaire n'est pas détruite
    public weak var delegate: NewAppleStoreViewControllerDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("controllers.new_apple_store.title", comment: "")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeViewController))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(submitAppleStore))
        
        nameLabel.text = NSLocalizedString("controllers.new_apple_store.name_label", comment: "")
        latitudeLabel.text = NSLocalizedString("controllers.new_apple_store.latitude_label", comment: "")
        longitudeLabel.text = NSLocalizedString("controllers.new_apple_store.longitude_label", comment: "")
        
        self.nameTextField.delegate = self
        self.latitudeTextField.delegate = self
        self.longitudeTextField.delegate = self
    }
    
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @objc public func submitAppleStore() {
        guard let name = nameTextField.text,
            name.count > 0,
            let latitude = latitudeTextField.text,
            let lat = Double(latitude),
            let longitude = longitudeTextField.text,
            let long = Double(longitude)
        else {
                let alert = UIAlertController(title: NSLocalizedString("app.vocabulary.error_title", comment: ""),
                                                message: NSLocalizedString("app.vocabulary.error_message", comment: ""),
                                                preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: NSLocalizedString("app.vocabulary.close", comment: ""),
                                    style: .cancel))
                self.present(alert, animated: true)
                return
        }
        let store = Store(name: name, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
        self.delegate?.newAppleStoreViewController(_newAppleStoreViewController: self, didCreateStore: store)
    }
    
    @objc public func closeViewController() {
        self.dismiss(animated: true)
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NewAppleStoreViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
