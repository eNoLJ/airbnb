//
//  AnywhereTripCollectionViewDataSource.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/21.
//

import UIKit

class AnywhereTripCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnywhereTripCollectionViewCell", for: indexPath)
        return cell
    }
    
    
}
