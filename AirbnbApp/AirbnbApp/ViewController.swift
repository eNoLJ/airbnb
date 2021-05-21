//
//  ViewController.swift
//  AirbnbApp
//
//  Created by 오킹 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nearTripCollectionView: UICollectionView!
    @IBOutlet weak var anywhereTripCollectionView: AnywhereTripCollectionView!

    let nearTripCollectionViewDataSource: UICollectionViewDataSource = NearTripCollectionViewDataSource()
    let anywhereCollectionViewDataSource: UICollectionViewDataSource = AnywhereTripCollectionViewDataSource()
    let nearTripCollectionViewDelegate = NearTripCollectionViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nearTripCollectionView.dataSource = nearTripCollectionViewDataSource
        nearTripCollectionView.delegate = nearTripCollectionViewDelegate
        anywhereTripCollectionView.dataSource = anywhereCollectionViewDataSource
    }


}

