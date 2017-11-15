//
//  PortraitNavigationController.swift
//  MapKitTuto
//
//  Created by etudiant on 15/11/2017.
//  Copyright © 2017 caro. All rights reserved.
//

import UIKit

class PortraitNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.visibleViewController?.supportedInterfaceOrientations ??
            super.supportedInterfaceOrientations
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
