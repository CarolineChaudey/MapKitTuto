//
//  NewAppleStoreViewController.swift
//  MapKitTuto
//
//  Created by etudiant on 15/11/2017.
//  Copyright © 2017 caro. All rights reserved.
//

import UIKit

class NewAppleStoreViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("controllers.new_apple_store.title", comment: "")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeViewController))
        
        nameLabel.text = NSLocalizedString("controllers.new_apple_store.name_label", comment: "")
        latitudeLabel.text = NSLocalizedString("controllers.new_apple_store.latitude_label", comment: "")
        longitudeLabel.text = NSLocalizedString("controllers.new_apple_store.longitude_label", comment: "")
        
        self.nameTextField.delegate = self
        self.latitudeTextField.delegate = self
        self.longitudeTextField.delegate = self
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @objc public func closeViewController() {
        self.dismiss(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NewAppleStoreViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
