//
//  StoreListViewController.swift
//  MapKitTuto
//
//  Created by etudiant on 16/11/2017.
//  Copyright © 2017 caro. All rights reserved.
//

import UIKit

class StoreListViewController: UIViewController {

    @IBOutlet var storeCollectionView: UICollectionView!
    weak var storeProvider: StoreProvider?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.storeCollectionView.register(UINib(nibName: "StoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Store")
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.storeCollectionView.reloadData()
    }
    
}

extension StoreListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeProvider?.stores.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let store = storeProvider?.stores[indexPath.item] else {
            fatalError()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Store", for: indexPath)
        if let storeCell = cell as? StoreCollectionViewCell {
            storeCell.titleLabel.text = store.name
            storeCell.latLabel.text = String(store.coordinate.latitude)
            storeCell.lonLabel.text = String(store.coordinate.longitude)
        }
        
        return cell
    }
}

extension StoreListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.bounds.width
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            width -= layout.minimumInteritemSpacing
        }
        return CGSize(width: width / 2, height: width / 2)
    }
}
