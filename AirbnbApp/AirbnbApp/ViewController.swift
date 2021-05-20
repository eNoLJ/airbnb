//
//  ViewController.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nearTripCollectionView: UICollectionView!
    let collectionViewDataSource: UICollectionViewDataSource = NearTripCollectionViewDataSource()
    let collectionViewDelegate = NearTripCollectionViewDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        nearTripCollectionView.dataSource = collectionViewDataSource
        nearTripCollectionView.delegate = collectionViewDelegate
    }


}

