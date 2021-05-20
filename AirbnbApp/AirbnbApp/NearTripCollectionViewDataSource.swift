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

class NearTripCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.bounds.height/2)
        return CGSize(width: 253, height: 74)
    }
    
}
