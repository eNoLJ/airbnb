//
//  NearTripCollectionViewDataSource.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/19.
//

import UIKit

class NearTripCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NearTripCollectionViewCell", for: indexPath)
        return cell
    }
}
